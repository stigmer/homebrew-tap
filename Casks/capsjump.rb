# Written by github.com/stigmer/capsjump's release workflow from
# packaging/capsjump.rb.in on every release. Edit the template there, not this file.
cask "capsjump" do
  version "0.3.0"
  sha256 "3758eebf4f534f72fcf99b51a8e36126facf5d637fa1220fe534af90edd2f3a3"

  url "https://github.com/stigmer/capsjump/releases/download/v#{version}/CapsJump-#{version}.zip"
  name "CapsJump"
  desc "Caps Lock shortcuts for apps, Chrome accounts, windows and links"
  homepage "https://stigmer.github.io/capsjump/"

  depends_on macos: :ventura

  app "CapsJump.app"
  binary "#{appdir}/CapsJump.app/Contents/Helpers/capsjump"

  # Quitting gives Caps Lock back; an app removed while running would leave it mapped.
  uninstall quit: "ai.stigmer.capsjump"

  caveats <<~EOS
    Grant CapsJump its permissions once (they survive upgrades):
      capsjump setup
    Then write your keys and sites, and check them:
      capsjump init
      capsjump check
  EOS
end
