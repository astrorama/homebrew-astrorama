require 'formula'

class Levmar < Formula
  homepage "http://www.ics.forth.gr/~lourakis/levmar/"
  url "https://src.fedoraproject.org/repo/pkgs/rpms/levmar/levmar-2.5.tgz/md5/7ca14d79eda6e985f8355b719ae47d35/levmar-2.5.tgz"
  version "2.5"
  sha256 "b70f6ac3eff30ec29150e217b137312cb84e85529815efea2c12e4eab74b9d75"
  depends_on "lapack"

  def install
    inreplace "Makefile.so", "-lf2c", ""
    inreplace "Makefile.so", " # where to place object files for shared lib", ""
    inreplace "Makefile", "-lf2c", ""

    system "mkdir", "sobj"
    system "make", "-f", "Makefile.so"
    system "make", "-f", "Makefile", "lmdemo"

    include.install "levmar.h"
    lib.install "sobj/liblevmar.so.2.2"
    ln_s "liblevmar.so.2.2", lib/"liblevmar.so.2"
    ln_s "liblevmar.so.2", lib/"liblevmar.so"
    prefix.install "lmdemo"
  end

  def test
    system "#{prefix}/lmdemo"
  end
end

