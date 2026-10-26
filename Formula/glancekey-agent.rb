class GlancekeyAgent < Formula
  desc "Unlock your computer and approve sudo with Face ID on your iPhone"
  homepage "https://www.glancekey.com/"
  version "1.0"

  if Hardware::CPU.arm?
    url "https://download.glancekey.com/glancekey-agent-1.0-linux-arm64"
    sha256 "7c1e41c7623a2f91f53d00791dae6cd757f317d62d462cb07d7f952c677a09f1"
  else
    url "https://download.glancekey.com/glancekey-agent-1.0-linux-amd64"
    sha256 "91a95f96d4cc4a1c76973226ec65d4ef313b9b3e3eb461d306b39ad5b038dca4"
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
