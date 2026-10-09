class Cnowledje < Formula
  desc "Read-only Confluence and Jira CLI for Server/Data Center"
  homepage "https://github.com/turtton/cnowledje"
  url "https://github.com/turtton/cnowledje/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "b670eb4fc1fb8e5e96c0db54143aed36e1318ab3dfb77a3e76bb3341ed9877f0"
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
    assert_match "cnowledje provides safe, read-only access to Confluence pages and Jira issues",
                 shell_output("#{bin}/cnowledje --help")
  end
end
