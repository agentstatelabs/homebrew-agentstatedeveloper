# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.4.4"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.4/asd-v1.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "e2af8cf2fd2d1c9efa40843a147caada825e7a903df9e49ec6db07e1fd6d8fc6"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.4/asd-v1.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "ca0f94dab0bc41d11899911c7348dabfc5e75e5b5f95519b7319f21c8ed5349f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.4/asd-v1.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "072007df72fe6fdb447d50b387c011361a833c6a5079cf01cd7b3024f0e4e2b6"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.4/asd-v1.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "489610582a8d4291ba815cc309e6fc5fc444448c7d106a90cfd786e9d2f8e25b"
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
