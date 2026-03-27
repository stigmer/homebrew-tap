class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.52"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.52/stigmer-v0.0.52-darwin-arm64.tar.gz"
      sha256 "d550fdd55da2ca2401af51c80b0ed3087384f40a1c1dd49ceb68f711660804f2"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.52/stigmer-v0.0.52-darwin-amd64.tar.gz"
      sha256 "815c4f0543d59381eeea1b18b5a4268684790c352870508b826f6252af41ccae"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.52/stigmer-v0.0.52-linux-amd64.tar.gz"
      sha256 "6fbad6f0b924e331ef3dd96a5b9fcd4e608d6cee28361750d0b6a501311d5c91"
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
