class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.73"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.73/stigmer-v0.0.73-darwin-arm64.tar.gz"
      sha256 "ffd6e0905e71aae8cc7cab123bdd8577ea8b85f65f2f2d1405d9a8fa5ef5b829"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.73/stigmer-v0.0.73-darwin-amd64.tar.gz"
      sha256 "45c6f322f25f813e37bd91d954384c30ddeaaf91f62052dde701b146f9f8d24a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.73/stigmer-v0.0.73-linux-amd64.tar.gz"
      sha256 "5c70d91e43bf83b3b9b122b0463e0416ca0fb99c60c49ca85c56614fd4702488"
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
