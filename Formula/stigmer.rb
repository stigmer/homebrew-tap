class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.79"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.79/stigmer-v0.0.79-darwin-arm64.tar.gz"
      sha256 "fccf7940d30845833f0114c55f3e7163053ee4236aa7f68fdcb4a1211571563d"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.79/stigmer-v0.0.79-darwin-amd64.tar.gz"
      sha256 "29dc98081c713a54ac8c7d823bb72274e57e214bb1ec81fc2e0d380244beec19"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.79/stigmer-v0.0.79-linux-amd64.tar.gz"
      sha256 "1f709bc1147d5d5557dd67d3230c82a7b419a0a1b08f6981955076e91a0d9588"
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
