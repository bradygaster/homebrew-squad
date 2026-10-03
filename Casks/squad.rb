cask "squad" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "3e0d922b725eaf1642b19d480cd45f9e611d644e9bc006b9816f3c1dae5facf9",
         intel: "cd8b1690da7f9cd8b8f98911fd3a9280e81b986aca32687e45e57bb774c88e1c"

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
