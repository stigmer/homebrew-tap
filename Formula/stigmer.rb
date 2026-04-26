class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.99"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.99/stigmer-v0.0.99-darwin-arm64.tar.gz"
      sha256 "08490ddfd63df350369da7438757a7fe836a837c4de47c7f82a564737d882e65"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.99/stigmer-v0.0.99-darwin-amd64.tar.gz"
      sha256 "f2d12d3a5240254b42fd68dfb223a9ad15d2d7c4c4a49471fb34861c5faa9f90"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.99/stigmer-v0.0.99-linux-amd64.tar.gz"
      sha256 "3f52f1ea9c9be4a23dc0ffad3826aaf8715e1c00015274f924d6ed06ccb741b0"
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
