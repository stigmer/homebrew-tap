class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.41"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.41/stigmer-v0.0.41-darwin-arm64.tar.gz"
      sha256 "b1f1ccf26501c89046c6a1106f2d491823d9623a55484c040fc93e8bc8e4c655"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.41/stigmer-v0.0.41-darwin-amd64.tar.gz"
      sha256 "feadefd0528c8bb6beeafad480a2b00c9c9de2b726593e8513cde1102b35e5c1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.41/stigmer-v0.0.41-linux-amd64.tar.gz"
      sha256 "d3e5062e9767a8bdca3798f04a7ece0ce85de0f9094cadf9cfde05389274bd8a"
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
