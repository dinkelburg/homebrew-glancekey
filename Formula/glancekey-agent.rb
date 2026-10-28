class GlancekeyAgent < Formula
  desc "Unlock your computer and approve sudo with Face ID on your iPhone"
  homepage "https://www.glancekey.com/"
  version "1.0.2"

  if Hardware::CPU.arm?
    url "https://download.glancekey.com/glancekey-agent-1.0.2-linux-arm64"
    sha256 "96fc74a87e8ef62d13b3604f7c7b98a4b0633835096547903a0ccaebe99ad52e"
  else
    url "https://download.glancekey.com/glancekey-agent-1.0.2-linux-amd64"
    sha256 "829dbbf1b8438985a91a3fe21431198403629176101d24ec721ae17ee11f3933"
  end

  depends_on :linux

  def install
    bin.install Dir["glancekey-agent-*"].first => "glancekey-agent"
  end

  def caveats
    <<~EOS
      Start it with your session, then pair your iPhone:
        glancekey-agent install-service
        glancekey-agent set-password
        glancekey-agent pair
      After brew upgrade, run glancekey-agent install-service again.
      Docs: https://www.glancekey.com/docs
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glancekey-agent version")
  end
end
