class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.1.1/stigmer-v0.1.1-darwin-arm64.tar.gz"
      sha256 "c91d87ecd884594c6d9463c8eda7994b5673ecf7fda02bb5a6220f899be07404"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.1.1/stigmer-v0.1.1-darwin-amd64.tar.gz"
      sha256 "cdb24a58c195e2ac52ee07ddfd494de47da219e5097d015f07d10f3575e00995"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.1.1/stigmer-v0.1.1-linux-amd64.tar.gz"
      sha256 "b6cb76e64597f32690397c4db2dd140c7afa56140439ff6186a3557a4959e983"
    end
  end

  def install
    bin.install "stigmer"
    bin.install "stigmer-server"
    bin.install "stigmer-workflow-runner"
  end

  def caveats
    <<~EOS
      stigmer server will auto-detect API keys from your environment.

        Option 1 (recommended):       export ANTHROPIC_API_KEY=sk-ant-...
        Option 2:                      export OPENAI_API_KEY=sk-...
        Option 3 (local, lower quality): brew install ollama && ollama serve

      Then run:  stigmer server
    EOS
  end

  test do
    system "#{bin}/stigmer", "--version"
  end
end
