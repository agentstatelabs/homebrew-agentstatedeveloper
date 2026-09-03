# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.2.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.2.0/asd-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "cc7ce9d4f12321e5db65f1fa3c612591bc96257f3d4fee1dcaf8d143dfa23784"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.2.0/asd-v1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "cd464fb38c0778ec30aa5fd422c058f3b296ed332b1530a24247fc3385f222c6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.2.0/asd-v1.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "36f0a1bc1045c7e9706064ac33ae8aaefa7686ca6c354948817a06f3f7e57280"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.2.0/asd-v1.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e4fdfe9a54ed88b2e5c0635e853754def70f13a223f6ac7154d7ed6370e1a41"
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
