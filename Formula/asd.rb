# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "0.9.40"
  license "BSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.40/asd-v0.9.40-aarch64-apple-darwin.tar.gz"
      sha256 "33796fbdb5fe5b54a7d9b38ecbac0497a3800661f445cd5e85eeb5b82ebd3440"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.40/asd-v0.9.40-x86_64-apple-darwin.tar.gz"
      sha256 "7204f97d5839a4b0c81de7373320465122cfb7e58dd6c21ea573941cb9368ee7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.40/asd-v0.9.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69c6465cb3dd43ecff0b7b5dfa9b22b9729318f5f47581c6f7f18f4d954f6a45"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v0.9.40/asd-v0.9.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b3242a19d2bfcc11201ae3d4110f24dddd96d34bce1a72c35f252bdec0c0ec8e"
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
