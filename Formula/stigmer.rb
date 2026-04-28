class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.2.0/stigmer-v0.2.0-darwin-arm64.tar.gz"
      sha256 "d3e2bbed7028e29ccfa9609020b63cc206feb7ae849ca42595880263d77c4e05"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.2.0/stigmer-v0.2.0-darwin-amd64.tar.gz"
      sha256 "8e4cb9f2211fcdf60528fd36ae989c8b36fdb5385c45dee38fd8054cd7df0ce1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.2.0/stigmer-v0.2.0-linux-amd64.tar.gz"
      sha256 "11acd13381f013981e2892501be7076edd16b265d05480c67b8693a8191e942f"
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
