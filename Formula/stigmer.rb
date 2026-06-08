class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "3.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.0/stigmer-v3.0.0-darwin-arm64.tar.gz"
      sha256 "8b2aa6753a9ca2c9293b243be3c31459a0ab2f0596b8a06048da488222de96c5"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.0/stigmer-v3.0.0-darwin-amd64.tar.gz"
      sha256 "18635c8345220a83296ece296c60dbfba3031a3d62e808aadb4c52d3063ad3b8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.0/stigmer-v3.0.0-linux-amd64.tar.gz"
      sha256 "090d7c4f7e8b1603916b13ee3bef035262c87c571909ea81c86eb6af67ff2bce"
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
