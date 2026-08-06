# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.3.1"
  license "BSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.3.1/asd-v1.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "5a71efd523d9ce9f7302e6f21f4a2eae5062a656f0cb7659ca2fd11cc730e453"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.3.1/asd-v1.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "bf3640788da6a2e116570cc59df9387eefd36eaba72d080a50f987fb05b6ef0d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.3.1/asd-v1.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b349be67267211c61873fe4cf0d04085824006835c2d6c4c02281debf33e6fa"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.3.1/asd-v1.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a72a8bfc31254a64267bc3d15f0c6d8733667cecabc250b530f834153d2a92a6"
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
