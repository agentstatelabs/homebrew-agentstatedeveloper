# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.4.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.0/asd-v1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "05b2e6a7e80a2917a4daa1be79bc21093e6d79f354c670316106138b36059285"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.0/asd-v1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "183723089ab7ca540e574f500c13efb978f65adff61ef9386e4d4d71806d95cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.0/asd-v1.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ce864e6dadfd05e21f2501ea10f13653062fdb88dc06c6bf8d2a2d11f1b0fbb"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.0/asd-v1.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b035e62523bbdc9dbaad9344c2fb60a1f68e6bc2ad1d86ab981256c54055d219"
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
