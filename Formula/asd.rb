# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "0.9.38"
  license "BSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.38/asd-v0.9.38-aarch64-apple-darwin.tar.gz"
      sha256 "6763f97ca52f28a1b69ff5cf757232ef2a4c40489b36c97b3e6714cf31b79256"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.38/asd-v0.9.38-x86_64-apple-darwin.tar.gz"
      sha256 "f75fb5aa5fe95838b50b791b763a6f67d7c945328f389758bcc376df51e9b857"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.38/asd-v0.9.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5dafaa74ab68efc8e1705918081fc51696d182faf822bd9403d4d446de2eaa44"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.38/asd-v0.9.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ccc9a29e12cbb5a93b8d06182b3916d4e096921bd53d8a9037fceef83d9995f6"
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
