class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.76"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.76/stigmer-v0.0.76-darwin-arm64.tar.gz"
      sha256 "28d9083fd7d8f36708e045e3b9e6cd0b6b613c4c31cc8f592f3e7040da98cfcc"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.76/stigmer-v0.0.76-darwin-amd64.tar.gz"
      sha256 "19dce93f112eee13f5f749a15a40ecd9f85c5e5e0a0493c06f8bfaf6ef32f33c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.76/stigmer-v0.0.76-linux-amd64.tar.gz"
      sha256 "4be34e672b1ab5858e783611061f6c41de8e662a0b1e4bc5939e931e6f9a5bce"
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
