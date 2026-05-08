class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.4.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.5/stigmer-v0.4.5-darwin-arm64.tar.gz"
      sha256 "007705e1f9d582c8e80dd4badbb55fd42d917e26ee39f032e1a62693a471b060"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.5/stigmer-v0.4.5-darwin-amd64.tar.gz"
      sha256 "f369a074f196a7fdadcbfd54755c5f28771eb2b06774bacb6119c6a561075d0d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.4.5/stigmer-v0.4.5-linux-amd64.tar.gz"
      sha256 "98cc0bd237392246f02799015dda40b9dbc9b562bffa81c77a27772d42ccc192"
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
