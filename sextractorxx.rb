# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Sextractorxx < Formula
  desc ""
  homepage ""
  url "https://github.com/ebertin/sextractorxx/archive/master.tar.gz"
  version "0.1"
  depends_on "cmake" => :build
  depends_on "wcslib"
  depends_on "ccfits"
  depends_on "yaml-cpp"
  depends_on "fftw"
  depends_on "levmar"
  depends_on "Alexandria"
  depends_on "boost-python"

  def install
    inreplace "SEBenchmarks/CMakeLists.txt", "find_package(OpenCV)", ""
    inreplace "ModelFitting/CMakeLists.txt", "find_package(OpenCV)", ""
    inreplace "PythonConfig/CMakeLists.txt", "find_package(Boost REQUIRED COMPONENTS python)", "find_package(Boost REQUIRED COMPONENTS python27)"
    inreplace "CMakeLists.txt", "Elements 5.2.1", "Elements 5.5"

    mkdir "build" do
       ENV["CMAKE_PROJECT_PATH"] = "#{HOMEBREW_PREFIX}/lib/cmake/ElementsProject"

       system "cmake", "..", "-DELEMENTS_BUILD_TESTS=NO", *std_cmake_args
       system "make"
       system "make", "install"
    end
  end

  test do
    system "SExtractor --help"
  end
end

