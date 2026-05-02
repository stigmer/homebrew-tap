class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.2/stigmer-v0.3.2-darwin-arm64.tar.gz"
      sha256 "23c2ba5e4195f218028263b5431399a59f239e072e77e3f58af5409d9b208159"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.2/stigmer-v0.3.2-darwin-amd64.tar.gz"
      sha256 "fb325ff847a85a95d496532503f5275df69cb2624e11d92b6507b5f17394faa3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.2/stigmer-v0.3.2-linux-amd64.tar.gz"
      sha256 "3082376abbff55a4c24e088d44c56a2f0369eda4b369cdd54648263a8e9a0c59"
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
