class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.5.1/stigmer-v0.5.1-darwin-arm64.tar.gz"
      sha256 "f74ebb499011a15c03913aea3578512d5112d8c58db752f29b23446a0f1ed1f2"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.5.1/stigmer-v0.5.1-darwin-amd64.tar.gz"
      sha256 "d0e03a41f1034b2335bab8cc4e023db51bdf95c5159dcdf7950dcac3d7f9acc3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.5.1/stigmer-v0.5.1-linux-amd64.tar.gz"
      sha256 "ac2bdfeaee09c4405c37a332cb6f1eb33b306194f710422636ac7ef339737f69"
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
