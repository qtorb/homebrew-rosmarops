class Rosmarops < Formula
  desc "See what your AI coding agents can reach on your computer, and how one agent can change another"
  homepage "https://github.com/qtorb/rosmarops"
  url "https://github.com/qtorb/rosmarops/archive/refs/tags/v0.15.0.tar.gz"
  sha256 "ad9a456968ba0b94550fc7ebc76450adc44fe93af32add9161ae554013e86906"
  license "AGPL-3.0-only"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", "-trimpath", "-ldflags=-X main.version=#{version}",
           "-o", bin/"rosmarops", "./cmd/rosmarops"
  end

  test do
    assert_match "rosmarops version #{version}", shell_output("#{bin}/rosmarops --version")
  end
end
