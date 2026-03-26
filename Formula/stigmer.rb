class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.43"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.43/stigmer-v0.0.43-darwin-arm64.tar.gz"
      sha256 "b09e79d3e78b3197ef01b48d14a78029b7441f4aded79ef624a0a214ab82b2b0"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.43/stigmer-v0.0.43-darwin-amd64.tar.gz"
      sha256 "02ce22792ba8e3aeaabcd24b4c2f7e05b2e9ac3ee50896f6f3fd82e8484adc29"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.43/stigmer-v0.0.43-linux-amd64.tar.gz"
      sha256 "c5f074f0d2c3cf46f59e6bb8f333be3b31d23feae3b66b2c6882c45c664ccead"
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
