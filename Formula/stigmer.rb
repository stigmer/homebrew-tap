class Stigmer < Formula
  desc "AI-powered workflow automation with local LLMs"
  homepage "https://github.com/stigmer/stigmer"
  version "1.0.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stigmer/stigmer/releases/download/v1.0.4/stigmer-v1.0.4-darwin-arm64.tar.gz"
      sha256 "ae065fb902ea4b8f25b1b800453a43bb077e47d2291424c9dca783a88f44eb5c"
    else
      url "https://github.com/stigmer/stigmer/releases/download/v1.0.4/stigmer-v1.0.4-darwin-amd64.tar.gz"
      sha256 "fef25e63924ea526755d7bab2ee59ec162b5f9903f5ee39b04faa1f8e040ef82"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stigmer/stigmer/releases/download/v1.0.4/stigmer-v1.0.4-linux-amd64.tar.gz"
      sha256 "7ee6c54972704405d3053beee39b546cb6a08417efc91459a658c96c8d2b6797"
    end
  end

  def install
    bin.install "stigmer"
    bin.install "stigmer-server"
    bin.install "stigmer-workflow-runner"
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
