class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.70"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.70/stigmer-v0.0.70-darwin-arm64.tar.gz"
      sha256 "fbb6ad4cfbdc1bbacc230f5201a3809b5477a1298456e90b22029489b748dc23"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.70/stigmer-v0.0.70-darwin-amd64.tar.gz"
      sha256 "e7398184b68510f0f0a40c6fc4d8925d641cc4369502e536515eb6629e490b57"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.70/stigmer-v0.0.70-linux-amd64.tar.gz"
      sha256 "55e10e066d49e9eebe1c5cbd6c6460c3337767525a905dc10933a8a364b381cc"
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
