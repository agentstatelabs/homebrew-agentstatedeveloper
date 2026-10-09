# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.4.8"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.8/asd-v1.4.8-aarch64-apple-darwin.tar.gz"
      sha256 "07f2b7cfe2ff47e00e2e8df459e19792bdac9f2b22622ff590fb831e8a821044"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.8/asd-v1.4.8-x86_64-apple-darwin.tar.gz"
      sha256 "0e56af03145fd181a1ec7e8c46ba89937a76a8397f9d4b256ccbb60e3d73ca37"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.8/asd-v1.4.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b88e2883f2d6cc08308deb86f892427e2de70225c73e189788d633d37f6e3083"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.8/asd-v1.4.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c00561944d4d16735c4287070e6a09e176895ae8f0c0a401e892bd96615986a"
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
