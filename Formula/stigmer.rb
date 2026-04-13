class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.85"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.85/stigmer-v0.0.85-darwin-arm64.tar.gz"
      sha256 "d6ddaddbd008be306dfe71b2df4ebdbe5c0d746c4e74b804edfdc5606160eaf7"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.85/stigmer-v0.0.85-darwin-amd64.tar.gz"
      sha256 "5518788eb4a7618cca813567399bc5eded78a72dd854d5eef194412edb3fb1c6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.85/stigmer-v0.0.85-linux-amd64.tar.gz"
      sha256 "03bff00432b663a27d1980e20920235016d492783b35aa258f45c499df95365a"
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
