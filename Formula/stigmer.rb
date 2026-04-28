class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.2.2/stigmer-v0.2.2-darwin-arm64.tar.gz"
      sha256 "62e1ed0eb61d4642a013930f37c7cddf7c15000fe7ba1abb9cde6b2351fe9ef7"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.2.2/stigmer-v0.2.2-darwin-amd64.tar.gz"
      sha256 "0a0956d0f9dc97e1ca65e2a0d8c43bf97f4be57d9eac31ff25c53af2d8987962"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.2.2/stigmer-v0.2.2-linux-amd64.tar.gz"
      sha256 "7d430d0ff13dd417e9b871d26a21dc15932493c2497f02f6c09ea74f35a568b4"
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
