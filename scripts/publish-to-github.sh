#!/usr/bin/env bash
#
# publish-to-github — gated push of a public repo's main branch + release tags
# to GitHub. Replaces GitLab push mirroring so that:
#   * ONLY main and release tags reach GitHub (never internal branches such as
#     claude/* or worktree-agent-*, which push mirroring would expose), and
#   * NOTHING pushes until scripts/leak-scan.sh passes (fail closed).
#
# Intended to run in GitLab CI (see .gitlab-ci.yml `publish-github`). Requires:
#   GITHUB_REPO   — "org/name" of the target GitHub repo
#   GITHUB_TOKEN  — PAT with `repo` scope (masked + protected CI variable)
#   TAG_PREFIX    — optional; only tags matching this are published (default: v)
#
# Exit: 0 pushed (or nothing to do), 1 leak-scan blocked, 2 misconfig.
set -euo pipefail

: "${GITHUB_REPO:?set GITHUB_REPO (org/name)}"
: "${GITHUB_TOKEN:?set GITHUB_TOKEN}"
TAG_PREFIX="${TAG_PREFIX:-v}"

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

# --- leak-scan gate: scan working tree + full history of what we will push ---
echo ">> leak-scan: working tree"
scripts/leak-scan.sh --tree
echo ">> leak-scan: full history of HEAD"
scripts/leak-scan.sh --range HEAD
echo ">> leak-scan clean"

# --- configure the GitHub remote (token embedded only in-process) ------------
GH_URL="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git"
git remote remove github 2>/dev/null || true
git remote add github "$GH_URL"

# --- push ONLY main (GitLab is source of truth; force-with-lease) ------------
# GitLab `origin` is authoritative for this tap: scripts/release.sh writes the
# formula here with the real artifact sha256s. GitHub can drift when a separate
# publisher writes to the GitHub tap directly (the asd-release-bot homebrew-tap
# GitHub Action did exactly this, leaving GitHub one commit ahead so a plain
# fast-forward push was rejected non-ff every release — same bug fixed in the
# CTXone tap). --force-with-lease makes GitLab deterministically win each release
# while still refusing to clobber the ref if it moved out from under us mid-job.
echo ">> pushing main -> github"
GH_MAIN="$(git ls-remote github refs/heads/main 2>/dev/null | awk '{print $1}')"
if [ -n "$GH_MAIN" ]; then
  git push --force-with-lease="refs/heads/main:${GH_MAIN}" github "HEAD:refs/heads/main"
else
  git push github "HEAD:refs/heads/main"
fi

# --- push release tags matching TAG_PREFIX -----------------------------------
if [ -n "${CI_COMMIT_TAG:-}" ]; then
  case "$CI_COMMIT_TAG" in
    "${TAG_PREFIX}"*)
      echo ">> pushing tag ${CI_COMMIT_TAG} -> github"
      git push github "refs/tags/${CI_COMMIT_TAG}" ;;
    *) echo ">> tag ${CI_COMMIT_TAG} does not match ${TAG_PREFIX}* — not published" ;;
  esac
fi

git remote remove github 2>/dev/null || true
echo ">> publish complete"
