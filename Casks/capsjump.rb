# Written by github.com/stigmer/capsjump's release workflow from
# packaging/capsjump.rb.in on every release. Edit the template there, not this file.
cask "capsjump" do
  version "0.7.0"
  sha256 "eb9e47a348f25422e98fa8bfd5a074c14cf0e249a75c8db27d0b0b01bd607047"

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
