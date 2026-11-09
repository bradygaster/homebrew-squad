cask "squad-preview" do
  arch arm: "arm64", intel: "x64"

  version "2.0.0-preview.4"
  sha256 arm:   "86140353de86e70d58790ce5fffd17b85d469b9317c6d8439e0a24577c359fa7",
         intel: "00264d3f873651fb5a04e00f136ae0ddfd99e94691d9f293b679042bbaf06bdf"

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
