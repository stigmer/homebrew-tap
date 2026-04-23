class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.92"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.92/stigmer-v0.0.92-darwin-arm64.tar.gz"
      sha256 "a0aec04f41d7a6bc7ff64d7f7fcd5051c8325071978048dcae9650a2279688fb"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.92/stigmer-v0.0.92-darwin-amd64.tar.gz"
      sha256 "49facb74912d2f791dd6cec7da418dadd1b5a1197883f5a242ebed2d49a5906b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.92/stigmer-v0.0.92-linux-amd64.tar.gz"
      sha256 "c3ede8d7cc9c9aa4496ce532e475c30c902d6912f09260487e27796301fe477e"
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
