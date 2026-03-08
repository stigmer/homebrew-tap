class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.29"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.29/stigmer-v0.0.29-darwin-arm64.tar.gz"
      sha256 "f27f9799e8cee970a7b26bf7a91ab05e0952e9f4128a5466de19e24b3ba93c07"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.29/stigmer-v0.0.29-darwin-amd64.tar.gz"
      sha256 "f75a9ef63d49391a65c20b959d90efcc7ab4ae003ed5f36cdbd93dc3ee7635a0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.29/stigmer-v0.0.29-linux-amd64.tar.gz"
      sha256 "cea4dea42b924aec4e9034030a647dde0a2e6c25d1af97b9552ade4f5cbcfd3e"
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
