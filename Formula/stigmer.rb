class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.69"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.69/stigmer-v0.0.69-darwin-arm64.tar.gz"
      sha256 "7ae349c46d3254dc03e3aa5af7faf7d013eb31f24936b42311dc19fcb4e21976"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.69/stigmer-v0.0.69-darwin-amd64.tar.gz"
      sha256 "2e330272e63f614974fb49e9e4374b94c50268a08d2727514323c2fe2031a34e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.69/stigmer-v0.0.69-linux-amd64.tar.gz"
      sha256 "5407f71f91e9899028d0ac1ccd5a0d9497a3b8d41733bd9fba04563514def0fe"
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
