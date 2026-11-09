cask "squad-preview" do
  arch arm: "arm64", intel: "x64"

  version "2.0.0-preview.3"
  sha256 arm:   "d08f2028673cda6c1ebb5f004d2865bb99932fd124490df2a59961139c094b6d",
         intel: "0cedcd2973f41c407211bd66468bbf4f15908bd10a796eb4229a92fdbffff45a"

  url "https://github.com/github/squad/releases/download/v#{version}/squad-darwin-#{arch}.tar.gz"
  name "Squad"
  desc "Programmable multi-agent runtime for GitHub Copilot (preview channel)"
  homepage "https://github.com/github/squad"

  conflicts_with cask: [
    "squad",
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
