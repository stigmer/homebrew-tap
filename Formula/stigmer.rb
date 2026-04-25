class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.94"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-darwin-arm64.tar.gz"
      sha256 "70b58f4780f5fcdccf6893eab1b04e29c224f6009bd65df8110bd7966f4358b4"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-darwin-amd64.tar.gz"
      sha256 "b25328bb2179e2579d794bdde82b35cba418ee02961fee65cf2db6214e16cb29"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.94/stigmer-v0.0.94-linux-amd64.tar.gz"
      sha256 "d6755a594c235ca040c984872bcfba53f50417f09f3341ccffb71da346a7037a"
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
