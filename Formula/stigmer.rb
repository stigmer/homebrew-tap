class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.3.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.4/stigmer-v0.3.4-darwin-arm64.tar.gz"
      sha256 "11a691d0cae80a72b07f1adfc7c148c84e524ffc3d8fd3d2963985c26ad01c26"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.4/stigmer-v0.3.4-darwin-amd64.tar.gz"
      sha256 "20df74d94d6d81cb42b1d69d706d167dc8e315c5bb209aeaceaf3dc589aec04d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.4/stigmer-v0.3.4-linux-amd64.tar.gz"
      sha256 "058f36f0d5246070766762a8a830f5d299f8bed67e88f9860f6c42e2d52b0cab"
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
