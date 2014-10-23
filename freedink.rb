require "formula"

class Freedink < Formula
  homepage "http://www.gnu.org/software/freedink/"
  url "http://ftpmirror.gnu.org/freedink/freedink-108.4.tar.gz"
  mirror "https://ftp.gnu.org/pub/gnu/freedink/freedink-108.4.tar.gz"
  sha1 "b487b7d0bb56c83e9cf14b903b89a3f8fca99fdc"

  head "git://git.savannah.gnu.org/freedink.git"

  depends_on "pkg-config" => :build
  depends_on "check"
  depends_on "sdl"
  depends_on "sdl_gfx"
  depends_on "sdl_image"
  depends_on "sdl_mixer"
  depends_on "sdl_ttf"
  depends_on "gettext"
  depends_on "libffi"
  depends_on "libzzip"
  depends_on "fontconfig"

  resource "freedink-data" do
    url "http://ftpmirror.gnu.org/freedink/freedink-data-1.08.20140901.tar.gz"
    mirror "https://ftp.gnu.org/gnu/freedink/freedink-data-1.08.20140901.tar.gz"
    sha1 "a27a7c73b7bc056890262c0ff7a48a7d16e1651b"
  end

  def install
    args = ["--prefix=#{prefix}",
            "--datarootdir=#{share}",
            "--disable-dependency-tracking"]

    system "./configure", *args
    system "make", "install"

    (share/"dink").install resource("freedink-data")
  end
end
