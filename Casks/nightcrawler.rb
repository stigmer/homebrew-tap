# Written by github.com/stigmer/nightcrawler's release workflow from
# packaging/nightcrawler.rb.in on every release. Edit the template there, not this file.
cask "nightcrawler" do
  version "0.1.0"
  sha256 "ca4855d35e2fc29e73a34365ae25b941950b4dec0510fe0052ce51ac84191b1c"

  url "https://github.com/stigmer/nightcrawler/releases/download/v#{version}/Nightcrawler-#{version}.zip"
  name "Nightcrawler"
  desc "Jump to a site's tab in the right Chrome account, or open it there"
  homepage "https://github.com/stigmer/nightcrawler"

  depends_on macos: ">= :ventura"

  app "Nightcrawler.app"
  binary "#{appdir}/Nightcrawler.app/Contents/Helpers/nightcrawler"

  caveats <<~EOS
    Grant Nightcrawler its permissions once (they survive upgrades):
      nightcrawler setup
    Then write your sites and check them:
      nightcrawler init
      nightcrawler check
  EOS
end
