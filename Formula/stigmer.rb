class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.86"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.86/stigmer-v0.0.86-darwin-arm64.tar.gz"
      sha256 "1b78b5a030fd89b437737f6deb819b2793e83fe9486864850062a13af16e85d6"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.86/stigmer-v0.0.86-darwin-amd64.tar.gz"
      sha256 "07662498c5cb7d200601fcfee5c93ebfdca81f9c84219fe30ac4e2bb38cd8369"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.86/stigmer-v0.0.86-linux-amd64.tar.gz"
      sha256 "46edc1dc0ef819c38a1df5a662c5f268eadad140d9e6d5e3e52f0fc1d3eb22f0"
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
