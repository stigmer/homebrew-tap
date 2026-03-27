class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.51"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.51/stigmer-v0.0.51-darwin-arm64.tar.gz"
      sha256 "5144288d1815268e1306b8e4dfb4b40236b9821246ed9d4426d7977bb4773418"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.51/stigmer-v0.0.51-darwin-amd64.tar.gz"
      sha256 "d6e490bfafc99af346cd7628fb86c6dcb221b023e8fb75a779ba4a718bab005b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.51/stigmer-v0.0.51-linux-amd64.tar.gz"
      sha256 "0eb7b004deaecf341974ef70a884b0c5b271754369a2e77293c9f0c5e939cc98"
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
