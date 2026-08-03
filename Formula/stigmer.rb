require "language/node"

class Stigmer < Formula
  desc "AI-powered workflow automation — agents, skills, MCP servers, workflows"
  homepage "https://github.com/stigmer/stigmer"
  url "https://registry.npmjs.org/@stigmer/cli/-/cli-3.5.3.tgz"
  sha256 "272de1ce3c62a5af0d28c2d1371dfcef82f8159f884718522b7970a6cac69cbd"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~CAVEATS
      The Stigmer backend server is downloaded automatically on first use,
      so no extra binaries are bundled. Provide a model API key first:

        Option 1 (recommended):         export ANTHROPIC_API_KEY=sk-ant-...
        Option 2:                        export OPENAI_API_KEY=sk-...
        Option 3 (local, lower quality): brew install ollama && ollama serve

      Then start the local stack with:  stigmer up
    CAVEATS
  end

  test do
    system "#{bin}/stigmer", "--version"
  end
end
