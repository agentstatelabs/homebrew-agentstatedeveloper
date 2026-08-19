# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "0.9.41"
  license "BSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.41/asd-v0.9.41-aarch64-apple-darwin.tar.gz"
      sha256 "af8434106786f85df2bad81cf1b816f5090f0eb4fff4302a0919ae851e0d4357"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.41/asd-v0.9.41-x86_64-apple-darwin.tar.gz"
      sha256 "f546dc574a2b884fa3268428fd942b6981203d1ea92bb35d90920d1895bc46dc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.41/asd-v0.9.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6c4ac598aaba5f6fb3f13056c70dc5c934dbdb4e13ae5f907532ce7c68c33a0"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.41/asd-v0.9.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c628e03d9f84dede7079afe25f1307c99ad671f905a7e7eb3020e777efd5afd5"
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
