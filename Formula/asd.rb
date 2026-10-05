# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.4.7"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.7/asd-v1.4.7-aarch64-apple-darwin.tar.gz"
      sha256 "26855e6f455d3e08ed73119b003e33f9fb01cac9b52f47ee171a9d01d5101a4d"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.7/asd-v1.4.7-x86_64-apple-darwin.tar.gz"
      sha256 "3730315fdb32d566bab227275a88ab82343eda5f909bc2fa31c348c9584a5891"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.7/asd-v1.4.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47bf4c67fb046f197a3e2b9420c3275faca6e5f24b61b9e58e34234a84ed51da"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.7/asd-v1.4.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b712fcbecd491dd93d668e8c05d14c9c330089c6aec4ea0eda69341eaa246edf"
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
