class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.49"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.49/stigmer-v0.0.49-darwin-arm64.tar.gz"
      sha256 "f6c25a71290c47f64235e0752f07acf3d37cfd000b8da0cab533cdf37949d772"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.49/stigmer-v0.0.49-darwin-amd64.tar.gz"
      sha256 "e7dd0c28b42f30c8917c1649bd9002022bace23d26d3986ede4ecf5ff801f298"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.49/stigmer-v0.0.49-linux-amd64.tar.gz"
      sha256 "fcdddcb0bd19e6bc5ce74cb78a0831a288ef67c6e5143101d75c1ca4b4a56dbe"
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
