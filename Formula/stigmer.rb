class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.95"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.95/stigmer-v0.0.95-darwin-arm64.tar.gz"
      sha256 "0776c26b10f406d9b563fd578bb7bb44c96b1e86167767c937af4a325cf5adf7"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.95/stigmer-v0.0.95-darwin-amd64.tar.gz"
      sha256 "065fa9848d3082862e57d6ff69bada90ae109b46e2fffb1910a8e5597cec0b17"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.95/stigmer-v0.0.95-linux-amd64.tar.gz"
      sha256 "096b6fa85549e0ab4d9b3cb1175f10d6e324f7ecfb2246a3049d288f0cd6179f"
    end
  end

  def install
    bin.install "stigmer"
    bin.install "stigmer-server"
    bin.install "stigmer-workflow-runner"
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
