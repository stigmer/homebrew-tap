class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.26"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.26/stigmer-v0.0.26-darwin-arm64.tar.gz"
      sha256 "2fd57314dcfdaa075cc20d785e2e1cd2616aa2ed941a5eec598e8768abf6ae31"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.26/stigmer-v0.0.26-darwin-amd64.tar.gz"
      sha256 "02cf6924002e6e0c4f92d6fd36370b225dc87f09b6662af1c3d09c9dd2eaee5b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.26/stigmer-v0.0.26-linux-amd64.tar.gz"
      sha256 "d087265c64b2acbf677eee24fb6850c91c20a6dc9631aa1462c0bcc157cc219e"
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
