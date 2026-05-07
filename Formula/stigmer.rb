class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.0/stigmer-v0.4.0-darwin-arm64.tar.gz"
      sha256 "2795fa4669156d37870bb916dbc69e211237cc52d0935a1a4998e3f3abfd7cf4"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.0/stigmer-v0.4.0-darwin-amd64.tar.gz"
      sha256 "8bca0175b8e544187180ab7972e273524eb1cea0df781aa79f7e21c99bda387b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.0/stigmer-v0.4.0-linux-amd64.tar.gz"
      sha256 "b32d1f7bbafc0d7990fe9c1633446e4379295ccd5e6f3ea73b1d82d8aa06694f"
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
