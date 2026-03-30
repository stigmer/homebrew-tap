class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.61"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.61/stigmer-v0.0.61-darwin-arm64.tar.gz"
      sha256 "3689f3c718bf28a0dec11791a9534d0460e25879d823d46e619db0387d5100a6"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.61/stigmer-v0.0.61-darwin-amd64.tar.gz"
      sha256 "b17fab6012d799294f1653cc49da77643f164185eb36dc37487c05feb51989b9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.61/stigmer-v0.0.61-linux-amd64.tar.gz"
      sha256 "3abc64f4efe034a8df9575308463037486649930b85f3e47161ef87e254f27fc"
    end
  end

  def install
    bin.install "stigmer"
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
