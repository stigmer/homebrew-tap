class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.27"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.27/stigmer-v0.0.27-darwin-arm64.tar.gz"
      sha256 "dfaf8192757e402efeec3d9069e1bf4ae23ec8cff1d2b0ac5d5435b8a5cf6c2a"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.27/stigmer-v0.0.27-darwin-amd64.tar.gz"
      sha256 "3e323dc4152737dc2a335bfb6411f9ee7b7c433f7ede11141be3d42bb85ed33d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.27/stigmer-v0.0.27-linux-amd64.tar.gz"
      sha256 "b152b075c92aed82817c22884fe81484432bf7f373cafa709b96d86d903843b3"
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
