# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Wcslib < Formula
  desc "brary and utilities for the FITS World Coordinate System"
  homepage "http://www.atnf.csiro.au/people/mcalabre/WCS/"
  url "http://ftp.debian.org/debian/pool/main/w/wcslib/wcslib_5.19.1.orig.tar.bz2"
  sha256 "6ec80091628465933213434cbd6f605685237f7f346b4e00c8f48fce7b9253df"
  depends_on "cfitsio"
  depends_on "doxygen" => :build
  depends_on "flex" => :build

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-cfitsiolib=#{Formula["cfitsio"].opt_lib}",
                          "--with-cfitsioinc=#{Formula["cfitsio"].opt_include}",
                          "--without-pgplot",
                          "--disable-fortran"
    ENV.deparallelize
    system "make"
    system "make", "-C", "doxygen"
    system "make", "install"
  end

  test do
    system "true"
  end
end
