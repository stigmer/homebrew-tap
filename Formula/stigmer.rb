class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.58"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.58/stigmer-v0.0.58-darwin-arm64.tar.gz"
      sha256 "e41032b3cb5642aa2af60c9ee0c110dc918021162beb2694986dfd7f8075e4e3"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.58/stigmer-v0.0.58-darwin-amd64.tar.gz"
      sha256 "dc7f1624d1a6a02e9e461dd1d396c46d6174a892f7e37e3f381e6b3b4a9c7dc6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.58/stigmer-v0.0.58-linux-amd64.tar.gz"
      sha256 "55b00bbb998bd21ab11f03039104c2904f576ad5fb393119ddc186690517a366"
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
