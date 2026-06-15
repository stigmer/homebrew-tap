require "language/node"

class Stigmer < Formula
  desc "AI-powered workflow automation — agents, skills, MCP servers, workflows"
  homepage "https://github.com/stigmer/stigmer"
  url "https://registry.npmjs.org/@stigmer/cli/-/cli-3.0.8.tgz"
  sha256 "305413073f4393ffa6b44aa4b5627ecd6461cf05c31e2858d33546b8fd9397d6"
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
