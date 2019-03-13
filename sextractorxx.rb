require_relative "download_strategy"

class Sextractorxx < Formula
  desc "The next generation SExtractor"
  homepage "https://github.com/ebertin/sextractorxx"
  url "https://github.com/ebertin/sextractorxx/archive/develop.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  version "0.1"
  depends_on "cmake" => :build
  depends_on "Alexandria"
  depends_on "boost-python3"
  depends_on "ccfits"
  depends_on "fftw"
  depends_on "levmar"
  depends_on "wcslib"

  def install
    inreplace "SEImplementation/CMakeLists.txt", "COMPONENTS python3", "COMPONENTS python37"
    inreplace "SEUtils/CMakeLists.txt", "COMPONENTS python3", "COMPONENTS python37"

    mkdir "build" do
      ENV["CMAKE_PROJECT_PATH"] = "#{HOMEBREW_PREFIX}/lib/cmake/ElementsProject"

      system "cmake", "..", "-DPYTHON_EXPLICIT_VERSION=3", "-DELEMENTS_BUILD_TESTS=NO", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system bin/"sextractor++", "--help"
  end
end
