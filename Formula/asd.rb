# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.4.6"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.6/asd-v1.4.6-aarch64-apple-darwin.tar.gz"
      sha256 "f06697f5de8b9c1c4f5585a68bd9c8feba8850cbc3403200c33ee3cf77266d13"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.6/asd-v1.4.6-x86_64-apple-darwin.tar.gz"
      sha256 "bd965d1a843d172011e70f8a38f4d83bf44820c09d6c03ffad9ef7e3d8dfb104"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.6/asd-v1.4.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2cd7a483ee6812c9749bdba5c80ffc1c3dcd87ee8e0bf42d8a8ef9191a0f80ea"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.6/asd-v1.4.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c1d19bd3032bb78a77754316c9a64432807df046218bb586ad8506ced6266d8d"
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
