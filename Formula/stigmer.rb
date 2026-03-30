class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.62"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.62/stigmer-v0.0.62-darwin-arm64.tar.gz"
      sha256 "84b00d3a10d8a19cae3b9800cee977515c928d20ad7baf19c98f753e694a9a4d"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.62/stigmer-v0.0.62-darwin-amd64.tar.gz"
      sha256 "d81aa5629fb2cd6a468c45f827f648bce5bf0bb139b84e49af3b8077e6f35945"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.62/stigmer-v0.0.62-linux-amd64.tar.gz"
      sha256 "4893c0e58553b0f841b98f02a4180d5288fbbf54b41aaad4ae111e7ee1ebc727"
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
