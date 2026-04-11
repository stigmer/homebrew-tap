class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.78"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.78/stigmer-v0.0.78-darwin-arm64.tar.gz"
      sha256 "17c1b6d9396ecd64ae525d70ab2dd5d02e775d96cb6aba87ed31ad029786581b"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.78/stigmer-v0.0.78-darwin-amd64.tar.gz"
      sha256 "d137dbe8f88c319c8ce2abd99d68cfb09b7bea3e4d993106390e04072f633c6d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.78/stigmer-v0.0.78-linux-amd64.tar.gz"
      sha256 "8b93774ac650266d028cc322b31ab9ad93f7650fbe2f75d399b16960d0424999"
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
