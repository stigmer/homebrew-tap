class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.91"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.91/stigmer-v0.0.91-darwin-arm64.tar.gz"
      sha256 "6fe454bab187f35a1472189854fa85fad4c78fdea3491dd77d124f38b9a6518d"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.91/stigmer-v0.0.91-darwin-amd64.tar.gz"
      sha256 "9a968108149de99a0021577e13ba3e7c67491b3a2188fd92b54a7f12246e32e7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.91/stigmer-v0.0.91-linux-amd64.tar.gz"
      sha256 "4ca095f1901e4e1929a039629149594a65390931cf74db576efc388ce7499f50"
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
