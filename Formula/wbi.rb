# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Wbi < Formula
  desc ""
  homepage ""
  license ""

  depends_on "git"
  depends_on "go" => :optional

  on_macos do
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
