class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.2.3/stigmer-v0.2.3-darwin-arm64.tar.gz"
      sha256 "4ded1860acb682841c89a1edfcc4818870b7fe237a558d663a0680c06619eccc"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.2.3/stigmer-v0.2.3-darwin-amd64.tar.gz"
      sha256 "4ba0b07be1f3b7fe48ffa0f42df6b7fb01a5757c8b10e67ceb601d6d18a2c539"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.2.3/stigmer-v0.2.3-linux-amd64.tar.gz"
      sha256 "1b75dbbb93decf135cb62d85900c3d3be72222dc6317f3af6dc8d79fc955f63b"
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
