class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.45"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.45/stigmer-v0.0.45-darwin-arm64.tar.gz"
      sha256 "3a8c4a7f0d86d0ff306b86d6c50688fb1bb22a0e2dbf37f45cbcd8831c49965c"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.45/stigmer-v0.0.45-darwin-amd64.tar.gz"
      sha256 "e714ff0d92f68455a6e612ce45fb1b006f9910ae850d13a2c58f5e2be8dfc587"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.45/stigmer-v0.0.45-linux-amd64.tar.gz"
      sha256 "4d8fd23a58ee7765a70fc917d7e31d65b8690e215b686b6b11cd298c656a1f08"
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
