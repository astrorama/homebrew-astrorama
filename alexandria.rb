# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Alexandria < Formula
  desc ""
  homepage ""
  url "https://codeload.github.com/nikoapos/Alexandria/zip/2.10_p1"
  version "2.10"
  depends_on "cmake" => :build
  depends_on "cfitsio"
  depends_on "ccfits"
  depends_on "Elements"

  def install
    mkdir "build" do
      ENV["CMAKE_PROJECT_PATH"] = "#{HOMEBREW_PREFIX}/lib/cmake/ElementsProject"
      system "cmake", "..", "-DELEMENTS_BUILD_TESTS=NO", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
