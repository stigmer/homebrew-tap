class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.68"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.68/stigmer-v0.0.68-darwin-arm64.tar.gz"
      sha256 "4db2ffd2c1f2b987f7b2e61e5f70cfffb1fa943f99ea1a08d3ec50528d6dc1ea"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.68/stigmer-v0.0.68-darwin-amd64.tar.gz"
      sha256 "fef8f1d92cb1ddb1690882d80f98e9ed87bef59b7b06934e25327ac1406bc454"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.68/stigmer-v0.0.68-linux-amd64.tar.gz"
      sha256 "6ad70b6d8a3b869fc7029c1a305e991ab97f60f5fbd69b782d9b0fba0a7c08fc"
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
