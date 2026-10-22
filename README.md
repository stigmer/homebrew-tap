# Stigmer Homebrew Tap

Homebrew tap for [Stigmer](https://stigmer.ai), the open-source backend for the
agents in your product.

## Installation

```bash
brew install stigmer/tap/stigmer
```

Then put your Anthropic key in your shell and start Stigmer:

```bash
export ANTHROPIC_API_KEY=<your Anthropic API key>
stigmer up
```

[Your first agent job](https://stigmer.ai/docs/getting-started/quickstart) takes
it from there.

## Update

```bash
brew update
brew upgrade stigmer
```

## Uninstall

```bash
brew uninstall stigmer
brew untap stigmer/tap
```

## About

`Formula/stigmer.rb` is rendered by
[`scripts/homebrew-formula.mjs`](https://github.com/stigmer/stigmer/blob/main/scripts/homebrew-formula.mjs)
and kept current by the daily
[`reconcile-homebrew`](https://github.com/stigmer/stigmer/blob/main/.github/workflows/reconcile-homebrew.yaml)
workflow, once a release's packages are old enough for Homebrew. Don't edit the
formula here; change the renderer.
