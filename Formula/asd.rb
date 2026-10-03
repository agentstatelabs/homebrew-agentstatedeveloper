# frozen_string_literal: true

class Asd < Formula
  desc "AgentStateDeveloper — semantic state layer + read API for AI agents on code"
  homepage "https://github.com/agentstatelabs/AgentStateDeveloper"
  version "1.4.3"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.3/asd-v1.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "ee4aa120895870fedce2782e8f7b304c499cee521588e8c044d408c2af9c9402"
    end
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.3/asd-v1.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "fdeadae5a9862017b0733d18a85d66540548e156402a00cd7f9bba7f29593750"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.3/asd-v1.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cee3c46e7ab5c5d350d8e59e4cd1065205eced7c66d4e1289ad5298bc9795dd5"
    end
    on_arm do
      url "https://github.com/agentstatelabs/agentstatedeveloper-releases/releases/download/v1.4.3/asd-v1.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd1ab43b56db982a6a3cf3ae953799bbebb3fd2978e0e701a61596744ff0eaf4"
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
