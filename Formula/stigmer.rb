class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.4.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.4/stigmer-v0.4.4-darwin-arm64.tar.gz"
      sha256 "1b7e9f942258fb381f8d87e5bb37b824d165ea6da6391d8c1677ca01e0df353b"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.4/stigmer-v0.4.4-darwin-amd64.tar.gz"
      sha256 "30b584e9f50633e63a3e2d18939bc919dce242cc3ef71ee83c57cdf50cacf466"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.4/stigmer-v0.4.4-linux-amd64.tar.gz"
      sha256 "cf1a46d415841cf0bf511ba6729876e40deffcd2b0dd5804d9cdefe4e8dfb3ae"
    end
  end

  def install
    bin.install "stigmer"
    bin.install "stigmer-server"
    bin.install "stigmer-workflow-runner"
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
