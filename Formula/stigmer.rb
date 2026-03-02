class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.23"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.23/stigmer-v0.0.23-darwin-arm64.tar.gz"
      sha256 "96bbb1a30646e2f5a941c71d9ac9a80c7005e8fe41946af1f440b5eab6bfa26c"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.23/stigmer-v0.0.23-darwin-amd64.tar.gz"
      sha256 "8bf03a4e72df9789a43eba63c519289572e75b94f7c3ed3f4133b5223bddd61a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.23/stigmer-v0.0.23-linux-amd64.tar.gz"
      sha256 "25bed2cfae088f0ff5d2dc4ecc21bd9f8ada02100745aebb62af36ba5ade3dc4"
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
