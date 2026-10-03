# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.4.2"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.2/asd-v1.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "c4d49102bf406bab5e43a0c3e4a5707b311b8d249d9a4b9f1f4410b62c404226"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.2/asd-v1.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "4ef82a3f274743c8b9f727cfe72d589774d70e897640aa0ddd5203216e19b3f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.2/asd-v1.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "922c2ec79854f462465dfb6df6ceb4c651a613dbe983af00db768a7a774921a2"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.2/asd-v1.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f6d327b83ea28dc8115aa084a69c8368720b64fb6138353df9875ae77829ee8e"
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
