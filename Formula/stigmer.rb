class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.94"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-darwin-arm64.tar.gz"
      sha256 "e7eaaf8a763d347464d26e9f8a57389591098d333f25519a6fb9ff38f34de19f"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-darwin-amd64.tar.gz"
      sha256 "865bfcc9025dcc34fe645cf86c5e189e7efbb53a4bb864fe43679fdadfe988c2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-linux-amd64.tar.gz"
      sha256 "0082019032b5860bf4bc171550c1902d51023affa7736a3ebf8c1aa42650dd7d"
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
