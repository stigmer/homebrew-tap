class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.21"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.21/stigmer-v0.0.21-darwin-arm64.tar.gz"
      sha256 "ab6b10e78e4c8b89dc9aa54eed1e1549eb84c03ec9eafed90e89a9f674982b67"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.21/stigmer-v0.0.21-darwin-amd64.tar.gz"
      sha256 "b81d4f1dd8273dae50a402005050765b9d5c7781df2afa83122e8259155074a4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.21/stigmer-v0.0.21-linux-amd64.tar.gz"
      sha256 "7ce29e72762251f838904f4600c2e9b510597e1c12c3817b592d0be7b0ce6e85"
    end
  end

  def install
    bin.install "stigmer"
  end

  test do
    system "#{bin}/stigmer", "--version"
  end
end
