class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.3.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.3/stigmer-v0.3.3-darwin-arm64.tar.gz"
      sha256 "6e5246b3bf82de5f9221f345d4efeaf31b92859293ee98ead46297f3816e0382"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.3/stigmer-v0.3.3-darwin-amd64.tar.gz"
      sha256 "8489b39ad85b650200b0f1b97952e3f2546ba971c38173069ba17918699f4b29"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.3.3/stigmer-v0.3.3-linux-amd64.tar.gz"
      sha256 "c414d1f7664c12755134c46e0233880d3bace6184ba50306dc98c01d4383d256"
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
