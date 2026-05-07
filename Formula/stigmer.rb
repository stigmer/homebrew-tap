class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.4.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.3/stigmer-v0.4.3-darwin-arm64.tar.gz"
      sha256 "a7ccd68395dc5db1fb2f30e76b5a8c6f2ddaf781842b2b329b0f1bc9036237da"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.3/stigmer-v0.4.3-darwin-amd64.tar.gz"
      sha256 "2c5f4c2e07e85c6b3460ef08742d21fef3005f8decc89b1497e91859391cef51"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.3/stigmer-v0.4.3-linux-amd64.tar.gz"
      sha256 "32b8ecd45f6ff3d025d7221c175984fedab7d492f83c9e0ff2dfb1bc6866fc24"
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
