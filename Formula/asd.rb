# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.4.5"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.5/asd-v1.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "6fa0b23cd5ac65e9f84c8f4febc3785d5515fbb888291bceb6b8bd90314383dc"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.5/asd-v1.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "10bbd9c0dd5a1e2d821fdf1225162ee7588ea9c5f58d4d95b2b46c0d478f41e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.5/asd-v1.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e3d5490a5950eeae28a955a749cb9259a02f7e26d8e130679e2e074b20872385"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.5/asd-v1.4.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f6ba95a41b357166e33140d26411e28c6f064fc831d776b50b2e0605f5f6bbd0"
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
