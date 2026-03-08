class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "0.0.32"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.32/stigmer-v0.0.32-darwin-arm64.tar.gz"
      sha256 "860f0a13c2a0853b805f1114fefff25613e991638c0f3e2072fc95238a89c0a1"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.32/stigmer-v0.0.32-darwin-amd64.tar.gz"
      sha256 "f5dbaa947ccda0e059920f28b36b567cc48cc64f643a4670586a69489748117d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v0.0.32/stigmer-v0.0.32-linux-amd64.tar.gz"
      sha256 "6931dc97248a718b3a81fe0f38e52074083204bb38f08d3293475d7e929cda22"
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
