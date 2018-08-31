# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Elements < Formula
  desc "C++/Python Build Framework"
  homepage ""
  version "5.5"
  url "https://github.com/degauden/Elements/archive/develop.tar.gz"
  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "log4cpp"

  needs :cxx11

  def install
    mkdir "build" do
      system "cmake", "..", "-DELEMENTS_BUILD_TESTS=NO", "-DSQUEEZED_INSTALL=YES", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "AddCppClass --help"
  end
end
