class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.40"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.40/stigmer-v0.0.40-darwin-arm64.tar.gz"
      sha256 "63fa41da3aa1214652cb6ff3ba8e7f438b94c4e73e86f284bf339729d4ade5d2"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.40/stigmer-v0.0.40-darwin-amd64.tar.gz"
      sha256 "cbb1691b203cbfd4e51063ea6acb82e574489a840c28f43815e3d310f1955565"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.40/stigmer-v0.0.40-linux-amd64.tar.gz"
      sha256 "57f5950d7aab3d34599e7cb7f1b6a482343095adedcbcd1cc53c7be9d7f4f482"
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
