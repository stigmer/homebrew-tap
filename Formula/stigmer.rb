class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "3.0.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.6/stigmer-v3.0.6-darwin-arm64.tar.gz"
      sha256 "b697e72fbf91db524f40b134f1fe9036b3e43c634b0a92fcd1f0580019f31e57"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.6/stigmer-v3.0.6-darwin-amd64.tar.gz"
      sha256 "594dba894b7e87acd52602ea50f7ba787f792ac0ea099c65facbebcd88f136f7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.6/stigmer-v3.0.6-linux-amd64.tar.gz"
      sha256 "5433f64f97df1ca67de500b76e0f0c9b146c73ee88f3b6e7dad8d86761eb1cf6"
    end
  end

  def install
    bin.install "stigmer"
    bin.install "stigmer-server"
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
