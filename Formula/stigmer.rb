class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.97"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.97/stigmer-v0.0.97-darwin-arm64.tar.gz"
      sha256 "4f895a1dbdba9763d1dea45711f62744120db1080884c2ff866b7f93b0d183ed"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.97/stigmer-v0.0.97-darwin-amd64.tar.gz"
      sha256 "bd105931599b8374e16f27eaeb0c5d2a2371e1e9b8571dc8162f423a5daeb385"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.97/stigmer-v0.0.97-linux-amd64.tar.gz"
      sha256 "38023aefcd056b9637da19b513d6a6bab7ea4c483235654e6e6a3ebf5940cf40"
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
