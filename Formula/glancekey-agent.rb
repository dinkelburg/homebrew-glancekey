class GlancekeyAgent < Formula
  desc "Unlock your computer and approve sudo with Face ID on your iPhone"
  homepage "https://www.glancekey.com/"
  version "1.0.1"

  if Hardware::CPU.arm?
    url "https://download.glancekey.com/glancekey-agent-1.0.1-linux-arm64"
    sha256 "5c25f48304492ecf9c99b4b76b4b94d3f6848120ac3b0ea90458e570832f59f1"
  else
    url "https://download.glancekey.com/glancekey-agent-1.0.1-linux-amd64"
    sha256 "c0fbbe0f3bcb0ad27f2c882266fd5b493fc46580c9f760097f15083be47a1453"
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
