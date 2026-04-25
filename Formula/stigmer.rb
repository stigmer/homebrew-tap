class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.93"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.93/stigmer-v0.0.93-darwin-arm64.tar.gz"
      sha256 "dce73436502d22d8575f241fa8b3e581775728baafb815687ee2c9b81772f307"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.93/stigmer-v0.0.93-darwin-amd64.tar.gz"
      sha256 "c782fd88bbc6a4bfce5139551ee1f0cfac5263273e2f1c6bc374aa7a8b0d4120"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.93/stigmer-v0.0.93-linux-amd64.tar.gz"
      sha256 "748e25993d2d3de55d25ebdc76de3f1d898aefb8e534006eb0585d54a6eea706"
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
