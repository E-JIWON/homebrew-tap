class Capywork < Formula
  desc "Menu bar capybaras showing what each Claude Code session is doing"
  homepage "https://github.com/E-JIWON/capywork"
  url "https://github.com/E-JIWON/capywork/archive/ca4c5c2e2ee41f3659e4152e4dd75dd4daa68f86.tar.gz"
  version "1.1.0"
  sha256 "5b62817bfed52c94024ee72de8bb03f56b82bf51dc157c04dbef3b73e2d68b42"
  license "MIT"

  depends_on macos: :sequoia

  def install
    # Built on your Mac, so it opens without the "unidentified developer" prompt.
    ENV["CAPYWORK_VERSION"] = version.to_s
    system "scripts/bundle.sh", prefix/"CapyWork.app"
    libexec.install "scripts/setup.sh", "scripts/hook.sh", "scripts/statusline.sh", "scripts/backfill.py"
    (bin/"capywork-setup").write_env_script libexec/"setup.sh", APP: opt_prefix/"CapyWork.app"
  end

  def caveats
    <<~EOS
      Finish setup (Claude Code hooks, start at login, grass backfill):
        capywork-setup
      Run it again after `brew upgrade capywork` to restart the app.
      Before `brew uninstall capywork`, undo the setup with:
        capywork-setup --uninstall
    EOS
  end

  test do
    assert_predicate prefix/"CapyWork.app/Contents/MacOS/CapyWork", :executable?
    assert_path_exists prefix/"CapyWork.app/Contents/Info.plist"
  end
end
