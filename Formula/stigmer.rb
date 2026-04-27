class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.1.0/stigmer-v0.1.0-darwin-arm64.tar.gz"
      sha256 "fa2509728236fb702a55524b1e67a503e06569460def8790e3d2ec434f1ca7fd"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.1.0/stigmer-v0.1.0-darwin-amd64.tar.gz"
      sha256 "ee11358892386c0d10a1387ca4a08b2a67f4b362a2c9658b171f6939fa1e86bf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.1.0/stigmer-v0.1.0-linux-amd64.tar.gz"
      sha256 "e9d83d06ed7396177e12c0753ad6870523944d2b691927deafce98d7eecf7452"
    end
  end

  def install
    bin.install "stigmer"
    bin.install "stigmer-server"
    bin.install "stigmer-workflow-runner"
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
