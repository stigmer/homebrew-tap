class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.84"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.84/stigmer-v0.0.84-darwin-arm64.tar.gz"
      sha256 "89e60f3c97ab95cb01bb93871977d086dc7db74cbae6ee65f9aa2f90a1413064"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.84/stigmer-v0.0.84-darwin-amd64.tar.gz"
      sha256 "b35e926809090f5f1356a8e5ca2869b83bdba1eabbc87fbdfa297c5d414a2876"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.84/stigmer-v0.0.84-linux-amd64.tar.gz"
      sha256 "321662f8d1bcbc4b0c0d2b5e45bda5abcc04a166e08b30bae54cdd520029de76"
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
