class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.18"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.18/stigmer-v0.0.18-darwin-arm64.tar.gz"
      sha256 "3fa3d89ca8b61fb4eff7bec0e709addaf251f810252a833020ade8370789ae3c"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.18/stigmer-v0.0.18-darwin-amd64.tar.gz"
      sha256 "b440be657f345df7a59471961fdb56aecdff30cfbb5bc0483cc1d6a316b6f669"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.18/stigmer-v0.0.18-linux-amd64.tar.gz"
      sha256 "4a01c197f427bd78062bf312d2c3b92b4ce14742319bae22570264b908433be9"
    end
  end

  def install
    bin.install "stigmer"
  end

  test do
    system "#{bin}/stigmer", "--version"
  end
end
