cask "glancekey" do
  version "1.0.2"
  sha256 "aa0baf86b1484babc07f0dd021ec6d9816f66d63d558e5c4b2ae50fc63d8b661"

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
