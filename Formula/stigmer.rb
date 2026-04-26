class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.98"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.98/stigmer-v0.0.98-darwin-arm64.tar.gz"
      sha256 "c5c718863ad45bdf8416a96f167d5751b9cf8bb4f49a82c7e4dce0cf24864dfd"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.98/stigmer-v0.0.98-darwin-amd64.tar.gz"
      sha256 "4eb777f7c4b7d5f1092f07257b37b107ca7d9c9b8cdd105689e9213f29681eca"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.98/stigmer-v0.0.98-linux-amd64.tar.gz"
      sha256 "165215005887ed2f539fe795e735b5bc18cde9e78e10ef151e5073c4ba895423"
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
