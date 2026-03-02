class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.24"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.24/stigmer-v0.0.24-darwin-arm64.tar.gz"
      sha256 "df292f7075e77825c60375a04075578594ca346d495cedc7f9629b81045f889e"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.24/stigmer-v0.0.24-darwin-amd64.tar.gz"
      sha256 "14a2a42e4dd1721c78a7e4e37840860028d16427e1fbf4f970c8df630a6075d9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.24/stigmer-v0.0.24-linux-amd64.tar.gz"
      sha256 "6ff958cceeba73747c4c29fc7811c2084ee5c71e1bb63f98cfaef214e9f5eba1"
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
