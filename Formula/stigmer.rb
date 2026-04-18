class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.90"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.90/stigmer-v0.0.90-darwin-arm64.tar.gz"
      sha256 "39bce38d00fa23e782b102262a55fc4b14e1a1c80c1258e755dc374a9529be73"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.90/stigmer-v0.0.90-darwin-amd64.tar.gz"
      sha256 "5619a42e5102a0ee753d7d9f397483aafefd69a7e2be0cca2f473b3519486da8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.90/stigmer-v0.0.90-linux-amd64.tar.gz"
      sha256 "a6c365184310a2638c076a7094122003e68e68f4f4b846d4b998ceb88e48ebb9"
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
