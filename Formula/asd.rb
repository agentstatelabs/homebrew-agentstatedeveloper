# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.4.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.1/asd-v1.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "12df710833a11c1320f1f7e560a5b3ef1c59cddb1455b86d2351f1ef402251fc"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.1/asd-v1.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "062af25c702e16c5b545d1d7c0a3765c75fbd7bd4322944ba924bb6ff6c43030"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.1/asd-v1.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc47f359277452c985a263519c4e016c63be94c49305e6a59390a3dedc2e6e42"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.1/asd-v1.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ab3c48884a32b5f40f7912baf17d178ca1f802fa9ebd4998dcc1868a6c6e11f"
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
