class Wbi < Formula
  desc "This is a command line interface (CLI) that allows users to interact with the World Bank Indicators API. The CLI allows users to search for indicators per source and to retrieve data for specific indicators."
  homepage "https://github.com/stumpyfr/world_bank_indicators_cli"
  license "MIT"

  depends_on "git"
  depends_on "go" => :optional

  on_macos do
    on_intel do
      url "https://github.com/stumpyfr/world_bank_indicators_cli/releases/download/v0.2.0/wbi_Darwin_x86_64.tar.gz"
      sha256 "fb498ecc0c2acfb0906e97f1d00b3cbca66565d84f46f555ff623fc1a1e99707"

      def install
        bin.install "wbi"
      end
    end
    on_arm do
      url "https://github.com/stumpyfr/world_bank_indicators_cli/releases/download/v0.2.0/wbi_Darwin_arm64.tar.gz"
      sha256 "1e7d5b32fc7095f54ffaba703372603608e73f96f2ecc55c08ae327f08ad5f2d"

      def install
        bin.install "wbi"
      end
    end
  end

  test do
    system "#{bin}/wbi -v"
  end
end
