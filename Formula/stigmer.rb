class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "2.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v2.0.0/stigmer-v2.0.0-darwin-arm64.tar.gz"
      sha256 "ec895424f5ef82c7e6a9cbe4da8ffc5c7da0e6e3bd0b41981bceb404c02bc45e"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v2.0.0/stigmer-v2.0.0-darwin-amd64.tar.gz"
      sha256 "63e94cd8d2fc157bbfd73ba1e4a785c0f5c9d1aa3bfe2c8c1431d9b1b004cdc3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v2.0.0/stigmer-v2.0.0-linux-amd64.tar.gz"
      sha256 "2d996d6587648f64502c13d97a1f6096055d41f23ff2acb2ca13149310bf97f8"
    end
  end

  def install
    bin.install "stigmer"
    bin.install "stigmer-server"
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
