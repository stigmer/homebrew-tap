class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.42"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.42/stigmer-v0.0.42-darwin-arm64.tar.gz"
      sha256 "8903e2420cd5848b358cc44ac57bbf6e5e3a0045328003476f117d881de40065"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.42/stigmer-v0.0.42-darwin-amd64.tar.gz"
      sha256 "0ef755dddb543d14e0f93e0f05018c9dd0a91e954ad53e1a193a08996800d37f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.42/stigmer-v0.0.42-linux-amd64.tar.gz"
      sha256 "0ddd8a0e9f2a5ed6690605c5887b135f33c0ce2c22ad0ad69040593ee7c5cd13"
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
