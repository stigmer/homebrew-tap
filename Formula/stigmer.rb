class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.83"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.83/stigmer-v0.0.83-darwin-arm64.tar.gz"
      sha256 "71c3f3aa60c58905514befb8fc130d6da5409640c154fa8e98220cb45db9545d"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.83/stigmer-v0.0.83-darwin-amd64.tar.gz"
      sha256 "de1d7fa624528b258859098a90e577a2aed410a571e0365af57ede5c13126f6d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.83/stigmer-v0.0.83-linux-amd64.tar.gz"
      sha256 "9dd7904a8b93149e9b7fc1ee9c5ad228c9054a4a82b81c8448d948c574ccf7bf"
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
