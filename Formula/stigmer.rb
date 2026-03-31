class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.66"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.66/stigmer-v0.0.66-darwin-arm64.tar.gz"
      sha256 "88fe7dd57249ab31bdceb69c6eeb41b6c8f02530c99911a653a7ddb865ba0dc3"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.66/stigmer-v0.0.66-darwin-amd64.tar.gz"
      sha256 "3baff499b4cdd3aca64e4f24f24076678c342e74b813182c514aa51e5b31e39d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.66/stigmer-v0.0.66-linux-amd64.tar.gz"
      sha256 "3ffa497be051967d8c93800f548b8b89c6ae79be79ed470311eb136df9236799"
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
