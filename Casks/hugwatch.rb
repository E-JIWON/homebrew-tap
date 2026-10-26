cask "hugwatch" do
  version "0.1.7"
  sha256 "ac4a2f985f51782d5c2064cdd8f59188b9793076cd6bc322cd0b1926bd8e0666"

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
