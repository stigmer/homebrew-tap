require "language/node"

class Stigmer < Formula
  desc "Open-source backend for the agents in your product"
  homepage "https://stigmer.ai"
  url "https://registry.npmjs.org/@stigmer/cli/-/cli-0.4.1.tgz"
  sha256 "7fc8ce0ad7cea857fdedf71c98927f661592c9796ff46bd6c8bfebd86a131f15"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~CAVEATS
      Agents run on your Anthropic key. Put it in your shell, then start
      Stigmer:

        export ANTHROPIC_API_KEY=<your Anthropic API key>
        stigmer up

      To save the key instead of exporting it each time, run `stigmer setup`
      once. The Stigmer server is downloaded on first use.
    CAVEATS
  end

  test do
    system "#{bin}/stigmer", "--version"
  end
end
