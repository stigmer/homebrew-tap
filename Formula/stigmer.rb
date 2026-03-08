class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.30"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.30/stigmer-v0.0.30-darwin-arm64.tar.gz"
      sha256 "7bd94407cdee063e4fa985680bdddec43b13e7047ace74d3e97ffe457b188721"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.30/stigmer-v0.0.30-darwin-amd64.tar.gz"
      sha256 "b7f48d23e6c589eed13f8b422ed904a1a708ba79c6edc986ccba4c916c1866cf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.30/stigmer-v0.0.30-linux-amd64.tar.gz"
      sha256 "2c066f683a0d997ddffa793316192e816b3a35c57bbdc2a24586d74682ea9780"
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
