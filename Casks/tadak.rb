cask "tadak" do
  version "1.1"
  sha256 "369110d5eb1ce21add16ecdecdad20785a75b0c4ee97ba1c8141d28099fd600c"

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
