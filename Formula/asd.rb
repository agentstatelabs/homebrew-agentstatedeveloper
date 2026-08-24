# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.0.0"
  license "BSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.0.0/asd-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "15407c5ef0aae38570677644dc99ae9698cbedf4e29ac332b95c43333b99dec0"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.0.0/asd-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "fe50f183e40660595e79105ca7af6d4a4a15453fd98f06d20670a3fb0090afb0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.0.0/asd-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ec317b34d353cb5f4bf9013486ea4a716d5e1f4641b435445c4b6dd8a312dae"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.0.0/asd-v1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee685121193fe49b089ec0fb343f483b1c8421b98decdfe7f52425687f2b5258"
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
