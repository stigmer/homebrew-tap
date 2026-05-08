class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.4.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.7/stigmer-v0.4.7-darwin-arm64.tar.gz"
      sha256 "638c560a0ee5b50479fc8cb581592387952efc1a3ed8c18d32a14b71e4cb1082"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.7/stigmer-v0.4.7-darwin-amd64.tar.gz"
      sha256 "725dc0d6fc7febe0447a3504f53c468c17e949da4897bc801efee99412a69895"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.7/stigmer-v0.4.7-linux-amd64.tar.gz"
      sha256 "0ca7d37b3b1ebc5c84748ecc5565c5a94cc5bd081ead5e67bd68f8d1a97c2251"
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
