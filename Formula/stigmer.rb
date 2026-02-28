class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.22"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.22/stigmer-v0.0.22-darwin-arm64.tar.gz"
      sha256 "067bdc2509c223d55d91baa29e8f1f6d882ccc9549cb0203631d016b6ddf63ce"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.22/stigmer-v0.0.22-darwin-amd64.tar.gz"
      sha256 "f44138dd72bdc6dad4f3c9eb334ad1747de4bd7ee4ac0f8749feb5a9ffdc1f22"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.22/stigmer-v0.0.22-linux-amd64.tar.gz"
      sha256 "8cb6128e60d249bb58e8de0c11301e466943fb431644e35041bc5070d63f42c0"
    end
  end

  def install
    bin.install "stigmer"
  end

  test do
    system "#{bin}/stigmer", "--version"
  end
end
