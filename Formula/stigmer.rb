class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.44"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.44/stigmer-v0.0.44-darwin-arm64.tar.gz"
      sha256 "51633209979cd8a241391783a1dd20068fc7eddfcff759cce91c7e92c4bd2142"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.44/stigmer-v0.0.44-darwin-amd64.tar.gz"
      sha256 "c49f9fefb3b696dc8de984e67fffc6995f215fe569da7ccd261e551bc413b0e9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.44/stigmer-v0.0.44-linux-amd64.tar.gz"
      sha256 "72c3e221aea930993355997910dcea12fff9ce90b7435ee50692c0e17ad01c1a"
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
