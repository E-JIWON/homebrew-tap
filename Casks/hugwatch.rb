cask "hugwatch" do
  version "0.1.0"
  sha256 "aef5625c033009c3eb2ef4ba074f31af5db3e796e2fe40dbb70e0c663395b826"

  url "https://github.com/E-JIWON/hugwatch/releases/download/v#{version}/HugWatch-mac.zip"
  name "HugWatch"
  desc "Menu bar watcher for PR reviews, Jira assignments, branch merges and mail"
  homepage "https://github.com/E-JIWON/hugwatch"

  depends_on macos: :sequoia

  app "HugWatch.app"

  # Not notarized: drop the quarantine flag so it opens without the "unidentified developer" prompt
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/HugWatch.app"],
                          writable_paths: ["HugWatch.app"], writable_base: :appdir
  end

  uninstall quit: "kr.bongchil.hugwatch"

  zap trash: "~/Library/Preferences/kr.bongchil.hugwatch.plist"
end
