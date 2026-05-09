class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.4.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.8/stigmer-v0.4.8-darwin-arm64.tar.gz"
      sha256 "a676a48a6002244f82dc4d57f6e41d6f2d9a6d031145f6a029563283ec6d0886"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.8/stigmer-v0.4.8-darwin-amd64.tar.gz"
      sha256 "574d8a6dbc0f91768653e0506d83980ebcba9514093f37ef9e58f135d9d3e267"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.8/stigmer-v0.4.8-linux-amd64.tar.gz"
      sha256 "dc43cb1c1d0cb4e01216f79fa40b53cc569efeceeaab8001e2e99d9fcaf402bc"
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
