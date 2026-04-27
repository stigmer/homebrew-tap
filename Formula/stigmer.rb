class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.1.2/stigmer-v0.1.2-darwin-arm64.tar.gz"
      sha256 "9b9ce99c8f25cc89922b7eda57a0f590d56e4313b55521598ea3017d9197ebb1"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.1.2/stigmer-v0.1.2-darwin-amd64.tar.gz"
      sha256 "3ffc8be6769d4cc5552a4757caeb9a849259c537056a263f3ae8ad8f720f8a6f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.1.2/stigmer-v0.1.2-linux-amd64.tar.gz"
      sha256 "2dd36ab2ef15778db0ba7a31cdb575b2d7a21f1e499a8c1afea5384a240ac3a4"
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
