cask "glancekey" do
  version "1.0"
  sha256 "51451d4f569aa23f297dae21da0b9c074979a9e4ce2377e3bc5fc3542958ab47"

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
