class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.13/stigmer-v0.0.13-darwin-arm64.tar.gz"
      sha256 "96398318a6c1388af8ba338a74e943f281f477b3ed4ee53346c0ffc7bb19e5fe"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.13/stigmer-v0.0.13-darwin-amd64.tar.gz"
      sha256 "5277e8e5c083e00c73265eedb9ef5920a4323f6178497c207586fb1465fb5ea9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.13/stigmer-v0.0.13-linux-amd64.tar.gz"
      sha256 "a7997b7a7b45db05cda5ff0362b0c8afdc6949c60de30e40f9ad3db6fd328fee"
    end
  end

  def install
    bin.install "stigmer"
  end

  test do
    system "#{bin}/stigmer", "--version"
  end
end
