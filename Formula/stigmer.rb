class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.56"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.56/stigmer-v0.0.56-darwin-arm64.tar.gz"
      sha256 "c6d994ee8530eec3e1e5aa0bed514ca93c76cc9384b1a4f1becba1c13d80e88c"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.56/stigmer-v0.0.56-darwin-amd64.tar.gz"
      sha256 "c72310753c46b0d1f244bbd19cb1827a1bf3b732db9397533048d17480680a45"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.56/stigmer-v0.0.56-linux-amd64.tar.gz"
      sha256 "31b865820d43b0638f2bfb54660bbf4bdf40678a93f54b9d58fa6d8a3c7c2f05"
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
