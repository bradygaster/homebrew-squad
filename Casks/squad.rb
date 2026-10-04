cask "squad" do
  arch arm: "arm64", intel: "x64"

  version "1.0.1"
  sha256 arm:   "47a8d44d0a9a338ae2c2b6192cb761187ebd71edbd1171a4800cee11cb001b43",
         intel: "b88db7e8949878ba2cdf756758651cd50a0e9b5fc83f4c759bd7438d596b4951"

  url "https://github.com/bradygaster/squad/releases/download/v#{version}/squad-darwin-#{arch}.tar.gz",
      verified: "github.com/bradygaster/squad/"
  name "Squad"
  desc "Programmable multi-agent runtime for GitHub Copilot"
  homepage "https://github.com/bradygaster/squad"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: [
    "squad-preview",
    "squad-insider",
  ]

  depends_on macos: ">= :big_sur"

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
