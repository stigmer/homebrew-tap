class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.48"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.48/stigmer-v0.0.48-darwin-arm64.tar.gz"
      sha256 "d2349464d706c685601feaf1fb14110db2218f551c69cc880771f0a38b5e6e37"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.48/stigmer-v0.0.48-darwin-amd64.tar.gz"
      sha256 "7a7ae3797555b7225fa0d225a36f36b82becfb6ed9d7d895432ee62713ad9074"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.48/stigmer-v0.0.48-linux-amd64.tar.gz"
      sha256 "a8b7e4aa72c652d36af10b3886441ecc72f97412e13379912eb90c471728f8b4"
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
