class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.39"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.39/stigmer-v0.0.39-darwin-arm64.tar.gz"
      sha256 "8852381c3d9af6762f0de78e291e88b526fc959d35a39b2ac0e5e449b31cf271"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.39/stigmer-v0.0.39-darwin-amd64.tar.gz"
      sha256 "afc5878d9657d230ce43b0fd926c898247fd79d551493e197e3d1432173ba17f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.39/stigmer-v0.0.39-linux-amd64.tar.gz"
      sha256 "d0c7501007832a62be981dc95c8a2b336b09f1ffaa36a24cfe649bb9db5cfbd2"
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
