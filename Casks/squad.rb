cask "squad" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "057c8d2296e1c95cd77933bae55475409a2dce88aa5b3443cc6ca6cfcd545631",
         intel: "4e4e8574f6a339f5537c82eb586d66ecf2ee3005e86b058b834b965be33a43cd"

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
