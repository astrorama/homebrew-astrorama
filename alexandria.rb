# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Alexandria < Formula
  desc ""
  homepage ""
  url "https://github.com/ayllon/Alexandria/archive/copr.tar.gz"
  version "2.9"
  depends_on "cmake" => :build
  depends_on "Elements" => :build
  depends_on "cfitsio" => :build
  depends_on "ccfits" => :build

  needs :cxx11

  def install
    mkdir "build" do
      ENV["CMAKE_PROJECT_PATH"] = "#{HOMEBREW_PREFIX}/opt"
      system "cmake", "..", "-DELEMENTS_BUILD_TESTS=NO", "-DSQUEEZED_INSTALL=YES", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
