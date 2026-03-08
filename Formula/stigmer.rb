class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.28"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.28/stigmer-v0.0.28-darwin-arm64.tar.gz"
      sha256 "4ec461c228f5dc7daa13bc032953c213b59953152350f3d6318671719ce2b6be"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.28/stigmer-v0.0.28-darwin-amd64.tar.gz"
      sha256 "9697a9093c0a166e7362882643403c342ecfe9d0a3d26cc71db6fbe7374009bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.28/stigmer-v0.0.28-linux-amd64.tar.gz"
      sha256 "1fd6fbd48c6c60d9fcbc7164dc789d1f5988497298f287171dec48b358845f81"
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
