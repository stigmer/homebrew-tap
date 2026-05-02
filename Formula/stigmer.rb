class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.0/stigmer-v0.3.0-darwin-arm64.tar.gz"
      sha256 "ba86f0358041238f26a65017083e572b3d19013de659a90f012cabdda23004e8"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.0/stigmer-v0.3.0-darwin-amd64.tar.gz"
      sha256 "8f7e36505d407e3b2df2a90eed6d90b4ed646ddf333da97b809be2eb461c1690"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.0/stigmer-v0.3.0-linux-amd64.tar.gz"
      sha256 "4d3535af9348570a3d5c80a070a0b40e8571a5915b59136525f3f02b08373dd1"
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
