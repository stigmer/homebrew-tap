class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.81"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.81/stigmer-v0.0.81-darwin-arm64.tar.gz"
      sha256 "b3241496290e1eb9c95c062eb77a219df531119d1dc48098b0693f2a1beb8748"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.81/stigmer-v0.0.81-darwin-amd64.tar.gz"
      sha256 "0593874f5a47a8b5ba277ec5496aa18a6319eeaca02a2d36b64daf0d68cd180a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.81/stigmer-v0.0.81-linux-amd64.tar.gz"
      sha256 "54710df859bb6786a63fb83f4c34eb66ea537cffe756d414eb3c5abc4b108ff1"
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
