class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.100"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.100/stigmer-v0.0.100-darwin-arm64.tar.gz"
      sha256 "01b4351df02588269a30002a6590e9c66568f785dc6db5634fd597f2be7b65cc"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.100/stigmer-v0.0.100-darwin-amd64.tar.gz"
      sha256 "034c9b867611392bca644e1a3e67dbffe7cf33251b9d0d42088b50df03f2cecd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.100/stigmer-v0.0.100-linux-amd64.tar.gz"
      sha256 "24ebc239b16ca4f6e60be45cfe17e5c07e5eda9c2659751246dea4198f1b8ca7"
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
