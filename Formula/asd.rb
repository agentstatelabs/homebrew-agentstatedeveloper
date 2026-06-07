# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/agentstatedeveloper"
  version "1.0.93"
  license "BSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.0.93/asd-v1.0.93-aarch64-apple-darwin.tar.gz"
      sha256 "88fa4df7d79eafca175393c02e4300c23680ea1573fe783b6b3033a541dda4cc"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.0.93/asd-v1.0.93-x86_64-apple-darwin.tar.gz"
      sha256 "d505c8445e5341e4f30121d6ecaf96316cd30745e6f72906159e1309ddbb16ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.0.93/asd-v1.0.93-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ad55b566b0cab3d84caa01b9a90189cfbcaf15db02c014c8a184b2c738e355bf"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.0.93/asd-v1.0.93-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a98533a492037dadb77347b4ed9d00bdefe2f190f519fcbf9d8da20622b42ef"
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

      Docs: https://github.com/agentstatelabs/agentstatedeveloper
    EOS
  end

  test do
    assert_match "asd", shell_output("#{bin}/asd --version")
  end
end
