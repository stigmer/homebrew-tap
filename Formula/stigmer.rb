class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.77"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.77/stigmer-v0.0.77-darwin-arm64.tar.gz"
      sha256 "f459286e8092217713218e9062aa129f13e9741dea34b7fadd4d6a2d8c7e600e"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.77/stigmer-v0.0.77-darwin-amd64.tar.gz"
      sha256 "9081fbb23c071813336a6743497e22e4770250ef251ccf65782053ab9b9dc902"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.77/stigmer-v0.0.77-linux-amd64.tar.gz"
      sha256 "b4b9dfa927beb7282a5763e32e328270c6f735c271c68838008adc335792b811"
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
