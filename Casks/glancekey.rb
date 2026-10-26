cask "glancekey" do
  version "1.0"
  sha256 "ce0a8d6f1a377889cf9b3dde8e80e8919b14163d16ee819f4b8018a526db56d7"

  url "https://download.glancekey.com/GlanceKey-#{version}.zip"
  name "GlanceKey"
  desc "Unlock your computer and approve sudo with Face ID on your iPhone"
  homepage "https://www.glancekey.com/"

  livecheck do
    url "https://download.glancekey.com/GlanceKey.zip"
    strategy :extract_plist
  end

  depends_on macos: :sonoma

  app "GlanceKey.app"

  uninstall quit: "nl.dinkelworks.glancekey.mac"

  zap trash: "~/Library/Preferences/nl.dinkelworks.glancekey.mac.plist"
end
