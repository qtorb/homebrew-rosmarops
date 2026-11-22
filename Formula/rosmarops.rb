class Rosmarops < Formula
  desc "See what your AI coding agents can reach on your computer, and how one agent can change another"
  homepage "https://github.com/qtorb/rosmarops"
  url "https://github.com/qtorb/rosmarops/archive/refs/tags/v0.18.0.tar.gz"
  sha256 "eb50089a0b7a59364c7af20b7334978b13a72f986f29b5eb245fb6c239f64cfe"
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
