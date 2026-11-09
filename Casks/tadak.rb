cask "tadak" do
  version "1.2"
  sha256 "6bb11ee6f1ecb0238d6e6a36105416d87dcfd0174b98eaba50b4c5f474b006b7"

  url "https://github.com/E-JIWON/tadak/releases/download/v#{version}/Tadak.zip"
  name "Tadak"
  desc "Menu bar app that plays keyboard and mouse sounds as you type"
  homepage "https://github.com/E-JIWON/tadak"

  depends_on macos: :sonoma

  app "Tadak.app"

  # Not notarized: drop the quarantine flag so it opens without the "unidentified developer" prompt
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Tadak.app"],
                          writable_paths: ["Tadak.app"], writable_base: :appdir
  end

  uninstall quit: "local.tadak"

  zap trash: "~/Library/Preferences/local.tadak.plist"

  caveats <<~EOS
    Tadak needs Accessibility access to hear your keys:
      System Settings > Privacy & Security > Accessibility > Tadak
    Each release is signed anew, so after `brew upgrade --cask tadak` turn Tadak off and on again there.
  EOS
end
