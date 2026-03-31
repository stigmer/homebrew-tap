class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.67"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.67/stigmer-v0.0.67-darwin-arm64.tar.gz"
      sha256 "d263ba140dddd2752586c0ef020fae1380dbe0503cc389baffb73b92cc0c72aa"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.67/stigmer-v0.0.67-darwin-amd64.tar.gz"
      sha256 "896c2c5e5bf3d0190732980a7eef1509e308722e2d51045dd06fcfc7486ff518"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.67/stigmer-v0.0.67-linux-amd64.tar.gz"
      sha256 "9616f1e425f7d67f0d7df37ac93405e28a492f263d23dc10b4afdba4df5a5b63"
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
