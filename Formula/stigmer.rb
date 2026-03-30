class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.65"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.65/stigmer-v0.0.65-darwin-arm64.tar.gz"
      sha256 "98361e65d15540b9c80be0b8689466bd338781c3ec72a7a9130dd992e7bf2405"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.65/stigmer-v0.0.65-darwin-amd64.tar.gz"
      sha256 "065164fd25b1178d5c83ef2f40b5bc276e86af41b8911b9b81ca2abfd37e1dcc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.65/stigmer-v0.0.65-linux-amd64.tar.gz"
      sha256 "b7961eab2f4ce6327a6eaf14d11b883bdd00d97b6ed555e66bf6542488e21991"
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
