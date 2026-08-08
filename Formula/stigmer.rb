require "language/node"

class Stigmer < Formula
  desc "AI-powered workflow automation — agents, skills, MCP servers, workflows"
  homepage "https://github.com/stigmer/stigmer"
  url "https://registry.npmjs.org/@stigmer/cli/-/cli-3.7.0.tgz"
  sha256 "e01def5c087c8b93925054193f860a748fbe741a34e2d5b700345be31bbed61e"
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
