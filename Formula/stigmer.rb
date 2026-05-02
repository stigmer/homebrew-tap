class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.1/stigmer-v0.3.1-darwin-arm64.tar.gz"
      sha256 "7dea41c97d3e89748b582759689d500109482da47704d0ce57ff3c71f3a6e431"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.1/stigmer-v0.3.1-darwin-amd64.tar.gz"
      sha256 "9da70a7c31097eec922ec19bd5e977e783304d6be2bbbda04245750ceddd266a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.1/stigmer-v0.3.1-linux-amd64.tar.gz"
      sha256 "525deb71aab79c0a09e2dd22e9858e0da2cb597ae39f0e57e157aa50dc792c6f"
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
