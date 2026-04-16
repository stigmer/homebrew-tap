class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.89"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.89/stigmer-v0.0.89-darwin-arm64.tar.gz"
      sha256 "a5cae21751c69a1f55182acd61b79b44f883bf78d2568fd2fcb27c366332768a"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.89/stigmer-v0.0.89-darwin-amd64.tar.gz"
      sha256 "e6b0a283b5da311e055f61509465a9044a0e6620a842d5063fc48b97191ff192"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.89/stigmer-v0.0.89-linux-amd64.tar.gz"
      sha256 "5566eb8652335456a7cf082a142fbe5f1b9298bbaac9323fdb2c804d7e733543"
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
