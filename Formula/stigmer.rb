class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "3.0.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.5/stigmer-v3.0.5-darwin-arm64.tar.gz"
      sha256 "70a721b9062b37338962569ad91baf4ccd45c87fd3337f158eed52b27a4da2ef"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.5/stigmer-v3.0.5-darwin-amd64.tar.gz"
      sha256 "e78beea5e8ad4c17899de52ec21b1fb5e8ecacbd2d9f5cfa92b23376203b9f7d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.5/stigmer-v3.0.5-linux-amd64.tar.gz"
      sha256 "427c11e2a1dc444c2e5d79685681c33144707d6bd07295982d1b34d713c3710a"
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
