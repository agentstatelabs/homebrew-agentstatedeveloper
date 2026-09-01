# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.1.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.1.0/asd-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "560bb32bdb7974850bd070d2a767df8a45fadf6f317cbea451290ac3f872bfdb"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.1.0/asd-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "36f022f6a15f62220e6c8975ed074fe47ece793977ab75d5e7725df09b19a4dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.1.0/asd-v1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4e3165969c9c2e65b550640157b783b6280a7aa9b5a4949bf5d91dd225ec604"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.1.0/asd-v1.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "014a218ebddff15116c7cf8689be21b59d48efb58e86c136734eb2dd62816fc2"
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
