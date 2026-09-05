# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.2.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.2.1/asd-v1.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "e7d740f248c97298f65baa12c971ac5296466e4ba6fa867b39a6bb82157c6df4"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.2.1/asd-v1.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "6d297b1f968b72d1110ad66eb9d9aad09e85003e80730e52355b340b7512879e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.2.1/asd-v1.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4f6cfde16f2d38932375ad69465f0ca3aa587ce6ef6744a265591f71c6b2a3c"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.2.1/asd-v1.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b489a6a7b06506052fe78ed9479f52c725905186f8619b55cbd4528a4dc49cb8"
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
