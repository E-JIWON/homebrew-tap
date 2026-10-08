# E-JIWON Homebrew Tap

```bash
brew install --cask e-jiwon/tap/clipshelf
brew install e-jiwon/tap/capywork && capywork-setup
```

| Name | App |
| --- | --- |
| `clipshelf` (cask) | [ClipShelf](https://github.com/E-JIWON/clipshelf) — clipboard shelf on the edge of your Mac screen |
| `capywork` (formula) | [CapyWork](https://github.com/E-JIWON/capywork) — menu bar capybaras for your Claude Code sessions. Builds from source (needs Xcode Command Line Tools), so no Gatekeeper prompt |

ClipShelf is not notarized yet. If macOS blocks the first launch, run `xattr -cr /Applications/ClipShelf.app`.
