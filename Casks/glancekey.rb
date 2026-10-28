cask "glancekey" do
  version "1.0.3"
  sha256 "5d09eca44c229577aebac54d9f09506dc557d3f7969c87461081862a1a522327"

  url "https://download.glancekey.com/GlanceKey-#{version}.dmg"
  name "GlanceKey"
  desc "Unlock your computer and approve sudo with Face ID on your iPhone"
  homepage "https://www.glancekey.com/"

  livecheck do
    url "https://download.glancekey.com/GlanceKey.dmg"
    strategy :extract_plist
  end

  depends_on macos: :sonoma

  app "GlanceKey.app"

  uninstall quit: "nl.dinkelworks.glancekey.mac"

  zap trash: "~/Library/Preferences/nl.dinkelworks.glancekey.mac.plist"
end
