class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.94"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-darwin-arm64.tar.gz"
      sha256 "e6f83113999cefa25ffcd60cd99cf76f3b387a1bf8eb45d6a66ad7487b871e8d"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-darwin-amd64.tar.gz"
      sha256 "8a7664d8935f5c9e261ca86e1ef8ce4899b21c4ad5195dca207e83248a708f66"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-linux-amd64.tar.gz"
      sha256 "6156dd52a5987bb1ce33158f207f1c3bf927f6fdbdcbc7291f8bce93bbfbe3eb"
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
