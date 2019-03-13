class Alexandria < Formula
  desc "SDC-CH common library for the Euclid project"
  homepage "https://github.com/nikoapos/Alexandria"
  url "https://github.com/nikoapos/Alexandria/archive/2.10_p1.tar.gz"
  version "2.10"
  depends_on "cmake" => :build
  depends_on "ccfits"
  depends_on "cfitsio"
  depends_on "Elements"

  def install
    mkdir "build" do
      ENV["CMAKE_PROJECT_PATH"] = "#{HOMEBREW_PREFIX}/lib/cmake/ElementsProject"
      system "cmake", "..", "-DELEMENTS_BUILD_TESTS=NO", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
