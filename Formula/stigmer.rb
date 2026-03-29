class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.60"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.60/stigmer-v0.0.60-darwin-arm64.tar.gz"
      sha256 "f5e666c746b880d471ac9b6a4527438221c66015eedf509bf82c07d35aa8d75e"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.60/stigmer-v0.0.60-darwin-amd64.tar.gz"
      sha256 "85920b0a1693a8ef74b62c9aca7d62208fbc48f7c0a096fb3946b5610b03a342"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.60/stigmer-v0.0.60-linux-amd64.tar.gz"
      sha256 "8483f8967a8ebb43ed29ab86bd0b4dfb83139f6f9b7cb9318506574934e3a4ed"
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
