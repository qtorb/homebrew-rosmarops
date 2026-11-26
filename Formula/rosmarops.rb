class Rosmarops < Formula
  desc "See what your AI coding agents can reach on your computer, and how one agent can change another"
  homepage "https://github.com/qtorb/rosmarops"
  url "https://github.com/qtorb/rosmarops/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "6bfbd1ca0956c44fda1f3b08ae09a33f5b8092191fad72085d3d3318a00c7efd"
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
