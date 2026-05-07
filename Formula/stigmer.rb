class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.1/stigmer-v0.4.1-darwin-arm64.tar.gz"
      sha256 "0ccee20785c665e6efa3c86ab2bdcd538e78fca89ea1ce478bcd2e3829cbec94"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.1/stigmer-v0.4.1-darwin-amd64.tar.gz"
      sha256 "954d2b418ed1c988279e4f108954683892101a67f9b8edb46406f4a5fad6d68d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.1/stigmer-v0.4.1-linux-amd64.tar.gz"
      sha256 "1ebe57fee33367eb86f9904bbec18d754e91ec28a86893c445a053cc29a9aa75"
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
