class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.72"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.72/stigmer-v0.0.72-darwin-arm64.tar.gz"
      sha256 "0b8bca90aa909db7437789cdb1f494d2f11650064821664082522b6c18505723"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.72/stigmer-v0.0.72-darwin-amd64.tar.gz"
      sha256 "13676f20c303a4617894df75baa4d09ab5ae61e5a1a1a92b5eba294d3514b8d8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.72/stigmer-v0.0.72-linux-amd64.tar.gz"
      sha256 "b2d5308226dcfd03b4a96cb32b52b99595a1780eba44c72287149c07d45c1887"
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
