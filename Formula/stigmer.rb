class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.94"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-darwin-arm64.tar.gz"
      sha256 "5de856ed198ad627cc4d9ef98b086f5674dca193088b4e5611a327dc41f9afbf"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-darwin-amd64.tar.gz"
      sha256 "8243f7e496e3a5ba4a6452891efb02c3fe4f0fd49a2684dee5f8e9ec55f46ad2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-linux-amd64.tar.gz"
      sha256 "e65e82a0b8f8bbbad4d17c7caa7601fcdf8cfdf4475d6798407917a1a0a5ba0a"
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
