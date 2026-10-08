cask "clipshelf" do
  version "0.2.0"
  sha256 "06afd5a5ad8a98c24ee0eea3dac46dd864ae3c643bff86b1331518b4edd65c24"

  url "https://github.com/E-JIWON/clipshelf/releases/download/v#{version}/ClipShelf.zip"
  name "ClipShelf"
  desc "Clipboard shelf on the edge of your Mac screen"
  homepage "https://github.com/E-JIWON/clipshelf"

  depends_on macos: ">= :sonoma"

  app "ClipShelf.app"

  zap trash: "~/Library/Caches/ClipShelf"

  caveats <<~EOS
    ClipShelf is not notarized. If macOS blocks it on first launch, run:
      xattr -cr "#{appdir}/ClipShelf.app"
    or install with: brew install --cask --no-quarantine e-jiwon/tap/clipshelf
  EOS
end
