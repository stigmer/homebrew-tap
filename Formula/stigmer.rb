class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.63"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.63/stigmer-v0.0.63-darwin-arm64.tar.gz"
      sha256 "fb30ae810b30ae3fb61308062d332029e7fff9219d9575c0666cfde1ef175899"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.63/stigmer-v0.0.63-darwin-amd64.tar.gz"
      sha256 "d09139d2de8d0e620f12e952f23f51b5ceb2156baf25e8e5790155fcc3a9d17e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.63/stigmer-v0.0.63-linux-amd64.tar.gz"
      sha256 "2ca49e55c11ac904c285d3a34bbbf83e5646901bb39cc0bb099ff55ea2e16727"
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
