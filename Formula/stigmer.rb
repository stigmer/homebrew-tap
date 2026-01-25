class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.12"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.12/stigmer-v0.0.12-darwin-arm64.tar.gz"
      sha256 "60d0baeaab2fb2693fb00c47f818d01fe65329d7f374145b61b09b54a8ea7c62"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.12/stigmer-v0.0.12-darwin-amd64.tar.gz"
      sha256 "a49835b72508c5b41b82b1a858ce19dec3e44ea30c437c44e276537dfc510a59"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.12/stigmer-v0.0.12-linux-amd64.tar.gz"
      sha256 "ea4633d24b981d63ea6c40fa564ec9cf70555f1ba189888c6eaf259fa9893d6b"
    end
  end

  def install
    bin.install "stigmer"
  end

  test do
    system "#{bin}/stigmer", "--version"
  end
end
