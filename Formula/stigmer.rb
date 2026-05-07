class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.4.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.2/stigmer-v0.4.2-darwin-arm64.tar.gz"
      sha256 "87431846bf106b4d9b9593e6fbd47411e82adb7c79bb39d3206831236f5d4a1d"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.2/stigmer-v0.4.2-darwin-amd64.tar.gz"
      sha256 "a1151e196155158c9548d776962567af866a20dac0162262a386eb9b99467e97"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.2/stigmer-v0.4.2-linux-amd64.tar.gz"
      sha256 "5a397513a165a179407cedbe5512baf9092daf2b9e001da9a5a6f1139a743306"
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
