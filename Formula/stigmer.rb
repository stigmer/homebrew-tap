class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.101"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.101/stigmer-v0.0.101-darwin-arm64.tar.gz"
      sha256 "b78a96b06956649fc6e21d8144ebb149b2f11a7dff29770a21e63e7888bbf140"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.101/stigmer-v0.0.101-darwin-amd64.tar.gz"
      sha256 "6d2b38b2a64626f85b8605086d30b6e4912ac5c1c9a6dff46180d2fd1a3ce5ad"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.101/stigmer-v0.0.101-linux-amd64.tar.gz"
      sha256 "4438233482a225a62c071223b9eeec07efc758a7c923e6a01f2e58811412027f"
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
