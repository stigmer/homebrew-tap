class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.93"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.93/stigmer-v0.0.93-darwin-arm64.tar.gz"
      sha256 "0c1004d254fe855decbdd6f9002a24b3c068aee18e7b65b426946888ef1cf731"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.93/stigmer-v0.0.93-darwin-amd64.tar.gz"
      sha256 "f40da1928beb8357594326af370e8e73a345c0139dc65ea11e39db7a602bc42a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.93/stigmer-v0.0.93-linux-amd64.tar.gz"
      sha256 "56f6b194247ea3b8fbf714117f53dcebb2297bf09876bcfbed96b2a49a354368"
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
