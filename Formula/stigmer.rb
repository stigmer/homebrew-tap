class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.82"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.82/stigmer-v0.0.82-darwin-arm64.tar.gz"
      sha256 "5dea49c46f53cbb991e83769ebd34371f3485d76459556bef6ecac2baa4c6adb"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.82/stigmer-v0.0.82-darwin-amd64.tar.gz"
      sha256 "33e7957495c1bab7f40b4183f3646a7947ad4c9a27baca89c5a6a172de2f0630"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.82/stigmer-v0.0.82-linux-amd64.tar.gz"
      sha256 "166d8549609bdb57be150b0501f34c5cf5be4e285c733a2e9dac53b39f009865"
    end
  end

  def install
    bin.install "stigmer"
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
