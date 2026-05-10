class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.5.0/stigmer-v0.5.0-darwin-arm64.tar.gz"
      sha256 "f6211e80f8f7481a5d8f8d73ed4d67676a253269ecc206cb69c726498936dce6"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.5.0/stigmer-v0.5.0-darwin-amd64.tar.gz"
      sha256 "83ebf66341cf2d0973db322ad3496929458fb861bcea51a92acee32d844a7225"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.5.0/stigmer-v0.5.0-linux-amd64.tar.gz"
      sha256 "7a574fb41d026283f17f9c736456031518697b4f5f4eb0ffccdd5dec195c2246"
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
