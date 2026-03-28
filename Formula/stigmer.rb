class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.53"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.53/stigmer-v0.0.53-darwin-arm64.tar.gz"
      sha256 "b83485800855a73ade3fc2e3517d6e3eec4040a30f7e8b2ae272bd016f627880"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.53/stigmer-v0.0.53-darwin-amd64.tar.gz"
      sha256 "a118ea90f75c4a0f10ec7d63839aef60eff98c38f8579ef534581c442598f284"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.53/stigmer-v0.0.53-linux-amd64.tar.gz"
      sha256 "e240373ed04105821d12d61218f25ff8a2175615e1cc6bd51ad138b3c485282f"
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
