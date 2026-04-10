class Ghostctl < Formula
  desc "Command-line interface for managing Ghost blogs"
  homepage "https://github.com/stumpyfr/ghostctl"
  url "https://github.com/stumpyfr/ghostctl.git",
      branch: "main",
      revision: "45cd5c53bcd6ee0a23ac3767198ad10c8d18446e"
  version "0.0.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/stumpyfr/ghostctl/internal/cli.Version=#{version}
      -X github.com/stumpyfr/ghostctl/internal/cli.Commit=homebrew
      -X github.com/stumpyfr/ghostctl/internal/cli.BuildDate=#{Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")}
    ]

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"ghostctl"), "./cmd/ghostctl"
    generate_completions_from_executable(bin/"ghostctl", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    output = shell_output("#{bin}/ghostctl version")
    assert_match version.to_s, output
  end
end
