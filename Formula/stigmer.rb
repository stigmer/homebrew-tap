class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "3.0.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.7/stigmer-v3.0.7-darwin-arm64.tar.gz"
      sha256 "a14ee5c45858b01c553b0b2d7a084fa8aebb020c5aac5841f47165e2e06a46aa"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.7/stigmer-v3.0.7-darwin-amd64.tar.gz"
      sha256 "a07587a11819f1c6f2e730e8a5f08ee62df23e0a3ca58f66ce9c0cf00670e1e5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.7/stigmer-v3.0.7-linux-amd64.tar.gz"
      sha256 "5ec82e2f88a950913c8ebe8cb419446670404cad24e7b00b795e763b928c2ee2"
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
