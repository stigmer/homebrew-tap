class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.31"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.31/stigmer-v0.0.31-darwin-arm64.tar.gz"
      sha256 "716c19541e04da4f92d8904c13efc4ba0fedf0bf1560b16cb736a50d875b99b8"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.31/stigmer-v0.0.31-darwin-amd64.tar.gz"
      sha256 "c58f26e40f1f2e41fce5bd0666a684f4c8a5d8d284b6e803630ebfeaa851357e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.31/stigmer-v0.0.31-linux-amd64.tar.gz"
      sha256 "6dcf1548dd6d6c8f2322fc10c8be4be2700478d80042570608c471477fc335ba"
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
