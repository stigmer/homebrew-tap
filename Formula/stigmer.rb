class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.2.1/stigmer-v0.2.1-darwin-arm64.tar.gz"
      sha256 "1ef41f90a515f920c81bcce3b294710a5ab74d143349aeaf811f7102b8616c9d"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.2.1/stigmer-v0.2.1-darwin-amd64.tar.gz"
      sha256 "2219ccec1c783c230dfafe558e7deb61993a0846bc25baca03139e5dad2043fd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.2.1/stigmer-v0.2.1-linux-amd64.tar.gz"
      sha256 "f94cc304b42056df312a09140c9123e1e45b5f351d92a694462ec330628d82d5"
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
