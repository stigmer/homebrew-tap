class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "1.0.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v1.0.3/stigmer-v1.0.3-darwin-arm64.tar.gz"
      sha256 "5535bd20e353bc7c69a06a35187ca4244ae01c084eab187c14b8753eb010d8f4"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v1.0.3/stigmer-v1.0.3-darwin-amd64.tar.gz"
      sha256 "1b0cc221fa6a9726a62f496186dbdf7dda1f1cb4173ebcab8c192677e0c399dd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v1.0.3/stigmer-v1.0.3-linux-amd64.tar.gz"
      sha256 "341ae0f5270455125efa330b4dd3c8c4791271f484a93bbcef2ee4c77623681f"
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
