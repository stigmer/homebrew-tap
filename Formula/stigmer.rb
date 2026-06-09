class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "3.0.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.2/stigmer-v3.0.2-darwin-arm64.tar.gz"
      sha256 "9ae9af82afbe86958ee6b7c55f0725dc388ada372b48406f08b36e10b6e160ba"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.2/stigmer-v3.0.2-darwin-amd64.tar.gz"
      sha256 "1fb9e223a7bb364236d5633704e6929ced235d5568f5484f23b6135b14447f5a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.2/stigmer-v3.0.2-linux-amd64.tar.gz"
      sha256 "4c82c645a2a5df39912b186e83d1b3f09e0696fda257867463c05e41202215b1"
    end
  end

  def install
    bin.install "stigmer"
    bin.install "stigmer-server"
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
