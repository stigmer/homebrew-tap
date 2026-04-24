class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.93"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.93/stigmer-v0.0.93-darwin-arm64.tar.gz"
      sha256 "3183477c10f4f12b4b50ea06456519d9f30e7b9d2481d281e23ca53070cd59f0"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.93/stigmer-v0.0.93-darwin-amd64.tar.gz"
      sha256 "b3cb2d1360ae6079b18edb326f7683577bc3038e1bdbb4bb4069cfa5335d6d37"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.93/stigmer-v0.0.93-linux-amd64.tar.gz"
      sha256 "8a5815d82231bc534fbb444ff88be2b25a4adc95c35f91cf6e4dc0ad4eda69a8"
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
