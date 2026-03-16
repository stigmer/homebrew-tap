class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.36"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.36/stigmer-v0.0.36-darwin-arm64.tar.gz"
      sha256 "294cb6406812e1bcc856ac1120dca5a532ce789fc5b118d799453cd9bc8396e5"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.36/stigmer-v0.0.36-darwin-amd64.tar.gz"
      sha256 "72cfb5156cc046119d0936b3624ced1fbca692bc8074f9abf2d0834426fdba07"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.36/stigmer-v0.0.36-linux-amd64.tar.gz"
      sha256 "b632f0701b189034c8651d917b39129985e1ec71920cef928bd4d2c253ac88d6"
    end
  end

  def install
    bin.install "stigmer"
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
