class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.64"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.64/stigmer-v0.0.64-darwin-arm64.tar.gz"
      sha256 "22aca22b836020ec9ab6162f3b5a90de91a5de913b6608bd207b8c6c415e1167"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.64/stigmer-v0.0.64-darwin-amd64.tar.gz"
      sha256 "980b85c15251a7a4f1df6a1a228eebadaac11bfcb926ef3eaf4a110d15783b4b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.64/stigmer-v0.0.64-linux-amd64.tar.gz"
      sha256 "4aa3b043162166f87b962d4b93cf6365a816e36717d74173021212b7e539a807"
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
