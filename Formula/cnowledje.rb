class Cnowledje < Formula
  desc "Read-only Confluence and Jira CLI for Server/Data Center"
  homepage "https://github.com/turtton/cnowledje"
  url "https://github.com/turtton/cnowledje/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7d7c8528c8d975c2297958b796737e3c8cc67c4a0026dee060534fd3e85a5ee3"
  license "MIT"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build

  on_linux do
    depends_on "dbus"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cnowledje --version")
    assert_match "cnowledje provides safe, read-only access to Confluence pages and Jira issues", shell_output("#{bin}/cnowledje --help")
  end
end
