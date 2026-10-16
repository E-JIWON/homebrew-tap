cask "hugwatch" do
  version "0.1.5"
  sha256 "05c1c9f0a4426953aca596a451fbcf21f2b172d098fa1294218b779c3b04b189"

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
