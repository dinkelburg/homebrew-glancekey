cask "glancekey" do
  version "1.0.1"
  sha256 "c2fc01f1ec13589608b4e9d097a25921402eaf08e959801dddc656aabd6173ed"

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
