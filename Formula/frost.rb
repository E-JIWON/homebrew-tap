class Frost < Formula
  desc "Menu bar app that keeps the front window sharp and frosts everything behind it"
  homepage "https://github.com/E-JIWON/frost"
  url "https://github.com/E-JIWON/frost/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "8e7a715111b106f02da8f043a4daf8f5b9f4f305cf6daa3155aab35c74b9cdad"
  license "MIT"

  depends_on macos: :sonoma

  def install
    # Built on your Mac, so it opens without the "unidentified developer" prompt.
    system "./build.sh", prefix/"Frost.app"
  end

  def caveats
    <<~EOS
      Open Frost:
        open #{opt_prefix}/Frost.app
      To upgrade or uninstall it by its short name, trust it once:
        brew trust --formula e-jiwon/tap/frost
      After `brew upgrade frost`, quit Frost from its panel and open it again.
      Each build is signed anew, so if keyboard window switches lag after an upgrade,
      run `tccutil reset Accessibility local.frost`, open Frost and allow it again
      from its panel (손쉬운 사용 권한 → 허용).
    EOS
  end

  test do
    system prefix/"Frost.app/Contents/MacOS/Frost", "--selftest"
  end
end
