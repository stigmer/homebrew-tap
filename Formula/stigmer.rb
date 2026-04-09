class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.75"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.75/stigmer-v0.0.75-darwin-arm64.tar.gz"
      sha256 "4cd9c4b681cff12604c123f7197af88f2c485e0efa653b8b2bac94d766ca32f7"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.75/stigmer-v0.0.75-darwin-amd64.tar.gz"
      sha256 "d098580b539b357d69968789c7d9e3a97bde5a0bd2df37df1e2ed22aabc14ded"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.75/stigmer-v0.0.75-linux-amd64.tar.gz"
      sha256 "7ea5e62d5d6c9a0c6f572347279bc55ef813ed2ac98f1647eb2906eefc636abd"
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
