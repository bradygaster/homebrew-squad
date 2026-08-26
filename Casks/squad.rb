cask "squad" do
  arch arm: "arm64", intel: "x64"

  version "0.13.0"
  sha256 arm:   "3d9666d60cbf1636ee21279f0c9ce8cb9a741dfc133ba40126359ce010ca9803",
         intel: "4f94576e9cd13f49c7f18b90555002958be23518a9ed95bda18f66b458680279"

  url "https://github.com/bradygaster/squad/releases/download/v#{version}/squad-darwin-#{arch}.tar.gz",
      verified: "github.com/bradygaster/squad/"
  name "Squad"
  desc "Programmable multi-agent runtime for GitHub Copilot"
  homepage "https://github.com/bradygaster/squad"

  livecheck do
    url :url
    strategy :github_latest
  end

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
