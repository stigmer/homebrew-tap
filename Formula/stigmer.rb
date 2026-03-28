class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.57"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.57/stigmer-v0.0.57-darwin-arm64.tar.gz"
      sha256 "8ed104ab24a759aee737555f28505c8aa9758d44df2f2a9699e6fe32b997831f"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.57/stigmer-v0.0.57-darwin-amd64.tar.gz"
      sha256 "a10c3090f455b89027c8472460cf3fc0f3334912e09105882a6b5809dfd4d8de"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.57/stigmer-v0.0.57-linux-amd64.tar.gz"
      sha256 "3cd496dd08becab7708d74e3f97b29eb32e008ed27b4cd08e419f78271850d67"
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
