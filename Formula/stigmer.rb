class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.59"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.59/stigmer-v0.0.59-darwin-arm64.tar.gz"
      sha256 "22b00976473ddfb9a0d47018a913f4bb528e2fb5c9cf23a896d98288e3ff2e94"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.59/stigmer-v0.0.59-darwin-amd64.tar.gz"
      sha256 "949bac49fab0897cfd530db5aeb7147368e5a1d226cbc09f2852db3523d154ac"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.59/stigmer-v0.0.59-linux-amd64.tar.gz"
      sha256 "cbc5039b7397f65dd2ca35141d71bd48d7bb84a2307b1b225b5da5bff4faa22c"
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
