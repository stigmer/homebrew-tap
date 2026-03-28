class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.55"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.55/stigmer-v0.0.55-darwin-arm64.tar.gz"
      sha256 "1cbcbcd8affc3ff810af8a19b9674ecefafa33d6e18ddabcdc36dc099a238cc3"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.55/stigmer-v0.0.55-darwin-amd64.tar.gz"
      sha256 "acfe911cc8644893075718bc809a12f0b190416938a2d40587023a87d9a988a9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.55/stigmer-v0.0.55-linux-amd64.tar.gz"
      sha256 "cfeca4faf60f5481330520171a3040bc4d1787fc823791706f6ab0cbc16ba0c0"
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
