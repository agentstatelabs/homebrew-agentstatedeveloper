# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "0.9.39"
  license "BSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.39/asd-v0.9.39-aarch64-apple-darwin.tar.gz"
      sha256 "06e7d14b0b53a1efb219c5577f887cf0d42b479874b8f0c4b9d1a50a4ec1a618"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.39/asd-v0.9.39-x86_64-apple-darwin.tar.gz"
      sha256 "6ed6a847317b7b33b0addd0cf51a99ec60f735be5d61648db8326e0cf8209dd0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.39/asd-v0.9.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87d98f3c787c8978c72e6f4cc197562dd7205675da738b0cfa1ab7a0ee41bd9e"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.39/asd-v0.9.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff040ba02df773c6e3a570c25318f3a3ce2d157191d53ef6d0bce8e10a2460e6"
    end
  end

  def install
    bin.install "asd"
    bin.install "asd-mcp"
    bin.install "asd-serve"
  end

  def caveats
    <<~EOS
      AgentStateDeveloper is installed. Next steps:

        cd <your-project>
        asd init                  # one-time setup + git hooks
        asd index .               # index the codebase
        asd repo add --activate   # register with the shared registry

      Then any tool wired to `asd-mcp` (Claude Desktop, Claude Code, Codex)
      will see this repo as its active context.

      Docs: https://github.com/agentstatelabs/AgentStateDeveloper
    EOS
  end

  test do
    assert_match "asd", shell_output("#{bin}/asd --version")
  end
end
