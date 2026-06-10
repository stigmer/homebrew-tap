class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "3.0.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.4/stigmer-v3.0.4-darwin-arm64.tar.gz"
      sha256 "30b03fce862778026947da90cded56c474d7443a030fca31198fdc692beb4394"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.4/stigmer-v3.0.4-darwin-amd64.tar.gz"
      sha256 "8f1a29cb9962825e3214c0cd988f1e4f09a5dd37d2d88a69d044a174702ea4ed"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.4/stigmer-v3.0.4-linux-amd64.tar.gz"
      sha256 "4e5e1d65e1145aae976d3d198833f4cfc28cf06b5dc2faf5ac6a8f1ed19b4d90"
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
