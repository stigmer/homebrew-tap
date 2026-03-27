class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.50"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.50/stigmer-v0.0.50-darwin-arm64.tar.gz"
      sha256 "189e28f1767dcbce717050c7c97d229b9ae29953e25cbb37f5e625f1a1d0f64f"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.50/stigmer-v0.0.50-darwin-amd64.tar.gz"
      sha256 "1c87ff71dec27a0101762ec9f38c8d127220bff19601d5feee27f847cb0873ce"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.50/stigmer-v0.0.50-linux-amd64.tar.gz"
      sha256 "63cd603b6f58388d5fad6c13484878c21a5459418338ab09af87e90460b58c0b"
    end
  end

  def install
    bin.install "stigmer"
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
