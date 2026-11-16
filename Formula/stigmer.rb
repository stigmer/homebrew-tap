require "language/node"

class Stigmer < Formula
  desc "Open-source backend for the agents in your product"
  homepage "https://stigmer.ai"
  url "https://registry.npmjs.org/@stigmer/cli/-/cli-0.2.0.tgz"
  sha256 "9aaea173b3e3281c391c28bdacde532562b0083914b82ae06f2d9e57c3884e94"
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
