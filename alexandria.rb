# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Alexandria < Formula
  desc ""
  homepage ""
  url "https://github.com/nikoapos/Alexandria/archive/2.10.tar.gz"
  version "2.10"
  depends_on "cmake" => :build
  depends_on "cfitsio"
  depends_on "ccfits"
  depends_on "Elements"

  def install
    inreplace "CMakeLists.txt", "Elements 5.2.2", "Elements 5.4"

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
