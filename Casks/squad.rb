cask "squad" do
  arch arm: "arm64", intel: "x64"

  version "2.0.0"
  sha256 arm:   "e65988c60f27cb1d8ffe00a7aca1ac3749d62727ebd2441a47fef94449ea6663",
         intel: "e52cc23e8da2379acf5879abdb7698510b9bff7a920f5cf8c598278d126613ce"

  url "https://github.com/github/squad/releases/download/v#{version}/squad-darwin-#{arch}.tar.gz"
  name "Squad"
  desc "Programmable multi-agent runtime for GitHub Copilot"
  homepage "https://github.com/github/squad"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: [
    "squad-preview",
    "squad-insider",
  ]

  depends_on macos: :big_sur

  binary "squad-darwin-#{arch}/squad"

  caveats do
    <<~EOS
      Squad drives the GitHub Copilot CLI, which is not bundled. Install it with:
        brew install --cask copilot-cli
    EOS
  end

  zap trash: [
    "~/.squad",
    "~/Library/Caches/squad",
  ]
end
