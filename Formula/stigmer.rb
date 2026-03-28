class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.54"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.54/stigmer-v0.0.54-darwin-arm64.tar.gz"
      sha256 "21a3eb6d847ad8a5c7916fd788cc1d9d1d2a9bf9ee9822822d513fe8009e3de0"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.54/stigmer-v0.0.54-darwin-amd64.tar.gz"
      sha256 "9dabea5ff7091e51c0b9d498eff45db9de2ba4a62685fdcef10f8ffce62ebaf2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.54/stigmer-v0.0.54-linux-amd64.tar.gz"
      sha256 "e85807db3c95183aa108b4cc853a1dfc18df16a4fad8964462de1a9c65fa0b3b"
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
