class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.25"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.25/stigmer-v0.0.25-darwin-arm64.tar.gz"
      sha256 "28107adf77f90da4b394a7ddab5b44259f3b96b310a4084e3b8cb2dbf1b224db"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.25/stigmer-v0.0.25-darwin-amd64.tar.gz"
      sha256 "efb398825afc91677c1dbdaa66596cd97e2230e6832854452857a8ec774123c1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.25/stigmer-v0.0.25-linux-amd64.tar.gz"
      sha256 "8ba55d9429406231567377724d0a0121d8b0b303901a8addb47fa637e57465cb"
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
