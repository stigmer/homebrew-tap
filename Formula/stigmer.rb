class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.94"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-darwin-arm64.tar.gz"
      sha256 "70a1cc6248ecb35b582cc0fb3d1bd94c6d0c6f0033ae2645328f07b4b3ee95b7"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-darwin-amd64.tar.gz"
      sha256 "812add9fd610c50a304ec2dd70b3680076dc8cc7cdab6939df3371f8843738b6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-linux-amd64.tar.gz"
      sha256 "8e0d5af63c80484b2493c9e8f8f669b84bfbe2fc270b081c8c526a2361131d74"
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
