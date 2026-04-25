class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.96"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.96/stigmer-v0.0.96-darwin-arm64.tar.gz"
      sha256 "4f68282241a8510904d62783ad80c45e7110ab6920263b153da31bad5f100ac9"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.96/stigmer-v0.0.96-darwin-amd64.tar.gz"
      sha256 "2cd215a3072a5363b705dffeb19379b24077b068f498986c9f99e81205dde5fe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.96/stigmer-v0.0.96-linux-amd64.tar.gz"
      sha256 "d7465c592b3871886c3b2db654c7ec49abd805849f32aae2e8bc6e6e059286bf"
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
