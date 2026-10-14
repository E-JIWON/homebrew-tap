cask "hugwatch" do
  version "0.1.1"
  sha256 "949272fe940c98db6c90770f685953891343d8c2916066c07200473f28efa254"

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
