class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "3.0.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.1/stigmer-v3.0.1-darwin-arm64.tar.gz"
      sha256 "38d14c21b4b7c4c53cedbc535ac650f1194e7f56f7a168e39ee4aa962e852cda"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.1/stigmer-v3.0.1-darwin-amd64.tar.gz"
      sha256 "f358c90e89fb870bf202ca297d1cec25a051b8c3cf00a846acec9c4ce6249ee9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.1/stigmer-v3.0.1-linux-amd64.tar.gz"
      sha256 "7877e15ea8b6e13bfd695686dbfb08e2373bb6cf7698f117bccfbcd2b2c49e80"
    end
  end

  def install
    bin.install "stigmer"
    bin.install "stigmer-server"
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
