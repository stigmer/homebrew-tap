class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.10/stigmer-v0.0.10-darwin-arm64.tar.gz"
      sha256 "62a051d42a1166ab979d6e1332916174bf5725aed0a8c772600d72c447f47ae0"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.10/stigmer-v0.0.10-darwin-amd64.tar.gz"
      sha256 "f884038e192f81815914f46c769c9534ff62df682ffbbba336692ed1d509e0a6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.10/stigmer-v0.0.10-linux-amd64.tar.gz"
      sha256 "3bf8442eb29149ff1837321804fe667cab6f41151853cbf0b033c1118faef94c"
    end
  end

  def install
    bin.install "stigmer"
  end

  test do
    system "#{bin}/stigmer", "--version"
  end
end
