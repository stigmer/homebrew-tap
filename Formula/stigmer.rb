class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.19"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.19/stigmer-v0.0.19-darwin-arm64.tar.gz"
      sha256 "30aa9642bd5df9593aab1ae364d6afe8b70dd278d1db0d99091d8f0f834c796d"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.19/stigmer-v0.0.19-darwin-amd64.tar.gz"
      sha256 "62bfb537c317560a4e0643203da136eed2633189a3804a15184c8ab7a1158f9c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.19/stigmer-v0.0.19-linux-amd64.tar.gz"
      sha256 "0f9df4004769da2d15cb89eeff0ad0ab54b3fb3e7af57a28f646fc638d3358bd"
    end
  end

  def install
    bin.install "stigmer"
  end

  test do
    system "#{bin}/stigmer", "--version"
  end
end
