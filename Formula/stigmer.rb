class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "3.0.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.3/stigmer-v3.0.3-darwin-arm64.tar.gz"
      sha256 "55d9167dbb39fb44568cf40f40b8aeb17b43ce90ea48b46eba696ac9aae9bd56"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.3/stigmer-v3.0.3-darwin-amd64.tar.gz"
      sha256 "6ba975b25a9cdcbafbcd50e95db29b998e7c4241284248dcc28f8aa25280f467"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v3.0.3/stigmer-v3.0.3-linux-amd64.tar.gz"
      sha256 "2b09afef311a4b712ae8675f3e97febe2a6f02f84d83bd4eaf4b26ca34bbc4d4"
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
