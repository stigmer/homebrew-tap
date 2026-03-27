class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.46"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.46/stigmer-v0.0.46-darwin-arm64.tar.gz"
      sha256 "e1d771bfb1895e9eaf1b90e180762c75258fc6d16b44bff3ff06a25be1371bf3"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.46/stigmer-v0.0.46-darwin-amd64.tar.gz"
      sha256 "f58e37b167c2496162fcc0cfb3f42db6a75b9d71c710e02ac11313882fef8ab1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.46/stigmer-v0.0.46-linux-amd64.tar.gz"
      sha256 "28e2f9a43d2f98cb5e52c4147e57b3cc2036e8d75dec25982d90a40c6528f1c2"
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
