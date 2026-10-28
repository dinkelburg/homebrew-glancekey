class GlancekeyAgent < Formula
  desc "Unlock your computer and approve sudo with Face ID on your iPhone"
  homepage "https://www.glancekey.com/"
  version "1.0.3"

  if Hardware::CPU.arm?
    url "https://download.glancekey.com/glancekey-agent-1.0.3-linux-arm64"
    sha256 "1560d9b578a5219a544846be485859ca92a7703ee14215061175cc0f5d34d6b2"
  else
    url "https://download.glancekey.com/glancekey-agent-1.0.3-linux-amd64"
    sha256 "a57c8f03482ebc0a62d3134bac938b2856bf50d90d8a346142d12c451c1208c7"
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
