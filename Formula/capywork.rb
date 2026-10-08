class Capywork < Formula
  desc "Menu bar capybaras showing what each Claude Code session is doing"
  homepage "https://github.com/E-JIWON/capywork"
  url "https://github.com/E-JIWON/capywork/archive/fdaf6ae18b1b608eab1e2a4ea3d0f8afb13518a2.tar.gz"
  version "1.1.0"
  sha256 "fa74be2219a61273e5f4e6bfaae5e2c606ed5d74017bec5739f777c84a2a341f"
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
