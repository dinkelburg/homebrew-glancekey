class GlancekeyAgent < Formula
  desc "Unlock your Linux computer and approve sudo with Face ID on your iPhone"
  homepage "https://www.glancekey.com/"
  version "1.0"

  depends_on :linux

  on_intel do
    url "https://download.glancekey.com/glancekey-agent-#{version}-linux-amd64"
    sha256 "33ab1e456f6bf6f76426d084a80fd91197fa420eaba7842c9c689020ff8c615e"
  end
  on_arm do
    url "https://download.glancekey.com/glancekey-agent-#{version}-linux-arm64"
    sha256 "fc92b74afe58868506c1c575fba79724249eadf75643a3c8bc744b3b64185517"
  end

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
