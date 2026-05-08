class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.4.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.6/stigmer-v0.4.6-darwin-arm64.tar.gz"
      sha256 "bb598f5ff2c0db0bd18ee24e3ca6fc378b19612e15226a5ee6b2d043c5d96fa3"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.6/stigmer-v0.4.6-darwin-amd64.tar.gz"
      sha256 "3a03dda0b857ee044c743cfedc5920144d16f0ea0b5479ea6391b4cd1586cf5e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.6/stigmer-v0.4.6-linux-amd64.tar.gz"
      sha256 "19dac5d536a5ea352ad5a677d029352c371923e2e6ba5d3c823e4e643fb7fd15"
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
