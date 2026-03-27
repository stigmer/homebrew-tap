class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.47"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.47/stigmer-v0.0.47-darwin-arm64.tar.gz"
      sha256 "5f4e302435119243428987c4d4cd149e03228467449035b23e2cda449e25fe30"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.47/stigmer-v0.0.47-darwin-amd64.tar.gz"
      sha256 "f6402b221a6c4b832387f6c2df783769320ec42c36eb40f77942ac06c5cc12f9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.47/stigmer-v0.0.47-linux-amd64.tar.gz"
      sha256 "402696127fa8903577edc726533f76713d5653e2bbf894391246abea6e430a44"
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
