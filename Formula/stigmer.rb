class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.11/stigmer-v0.0.11-darwin-arm64.tar.gz"
      sha256 "43b2a08c8d35b1fe7c8afb83e45ac257a813106193a920445fe121aeb6ff7f04"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.11/stigmer-v0.0.11-darwin-amd64.tar.gz"
      sha256 "27e54dadb4c25cc9c61fd2ed62f7e278a6bb272fc0bcc895b1b8edf81ad33bb8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.11/stigmer-v0.0.11-linux-amd64.tar.gz"
      sha256 "3319b7b611691195693b6255532043babe9588092858b86627d6c964167b4089"
    end
  end

  def install
    bin.install "stigmer"
  end

  test do
    system "#{bin}/stigmer", "--version"
  end
end
