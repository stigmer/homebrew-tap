class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.33"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.33/stigmer-v0.0.33-darwin-arm64.tar.gz"
      sha256 "63962c3afb3b2ca12b7e3b12ba10d7402a9e0f444b0c4b55b90f0007b41c4e66"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.33/stigmer-v0.0.33-darwin-amd64.tar.gz"
      sha256 "107b6527d40691265bef2d53101b494d3b88b8119b623465766d8ef8790e722c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.33/stigmer-v0.0.33-linux-amd64.tar.gz"
      sha256 "6c8fa1b6b4a40bead6b4965960e914d3c6d8e41990af25148853db739ccb43f4"
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
