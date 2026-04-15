class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.87"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.87/stigmer-v0.0.87-darwin-arm64.tar.gz"
      sha256 "4dccade78c1b18468ed8d7feb18d088d154759e02b6a76c82ee430a16809a9ab"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.87/stigmer-v0.0.87-darwin-amd64.tar.gz"
      sha256 "513aa6ddeef70811f2ad0faf08fc2c362990156d65862549681b1eeb1a87b2b3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.87/stigmer-v0.0.87-linux-amd64.tar.gz"
      sha256 "7f2436d9ca17b3ad941a79ed6a031d5f0e2bdc90cac0edf95b3f4a9eec6ababe"
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
