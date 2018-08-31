# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Sextractorxx < Formula
  desc ""
  homepage ""
  url "https://github.com/ebertin/sextractorxx/archive/master.tar.gz"
  version "0.1"
  depends_on "cmake" => :build
  depends_on "Alexandria"
  depends_on "wcslib"
  depends_on "opencv"
  depends_on "ccfits"
  depends_on "yaml-cpp"

  def install
    mkdir "build" do
       ENV["CMAKE_PROJECT_PATH"] = "#{HOMEBREW_PREFIX}/opt"
       system "cmake", "..", "-DELEMENTS_BUILD_TESTS=NO", "-DSQUEEZED_INSTALL=YES", *std_cmake_args
       system "make"
       system "make", "install"
    end
  end

  test do
    system "SExtractor --help"
  end
end

