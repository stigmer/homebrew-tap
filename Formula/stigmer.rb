class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "2.0.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v2.0.1/stigmer-v2.0.1-darwin-arm64.tar.gz"
      sha256 "d70d6bd81e44a33119178f2f6499e008dc5c2b28e97c02f49c039816e842b742"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v2.0.1/stigmer-v2.0.1-darwin-amd64.tar.gz"
      sha256 "b27ec6f5314ba78616262d2622e8664bcd752529f4681c26a1c3eec707a8848d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v2.0.1/stigmer-v2.0.1-linux-amd64.tar.gz"
      sha256 "f4fd201e56e75c83ffa9fe8c61e6570811d9c3e8502a25864582cbb149c2fb66"
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
