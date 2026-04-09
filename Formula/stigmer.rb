class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.74"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.74/stigmer-v0.0.74-darwin-arm64.tar.gz"
      sha256 "bba5eb3aac105ff5a3ef3bcafcc0e420c6103dff5d6729e46f2d3adf11442cd0"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.74/stigmer-v0.0.74-darwin-amd64.tar.gz"
      sha256 "21a00150ca6f98fcfe66ae610a6e5e9d440c9535bab8d389b34c7ba7be7673d4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.74/stigmer-v0.0.74-linux-amd64.tar.gz"
      sha256 "ef7640501dd14b216167a86e86179bcd9001a97252ca93decaf7fada5d2f366b"
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
