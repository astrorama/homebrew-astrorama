class Elements < Formula
  include Language::Python::Virtualenv

  desc "C++/Python Build Framework"
  homepage "https://github.com/astrorama/Elements"
  url "https://github.com/astrorama/Elements/archive/5.4.tar.gz"
  depends_on "boost"
  depends_on "cmake"
  depends_on "log4cpp"
  depends_on "pkg-config"
  depends_on "python"

  resource "pytest" do
    url "https://files.pythonhosted.org/packages/db/88/11b1a23db24d29556b5a0fa661bf7f2205d7b5f9bd2c9f578e5dd4997441/pytest-3.9.1.tar.gz"
    sha256 "8c827e7d4816dfe13e9329c8226aef8e6e75d65b939bc74fda894143b6d1df59"
  end

  def install
    inreplace "cmake/ElementsLocations.cmake", "set(lib_install_suff lib64)", "set(lib_install_suff lib)"

    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resource("pytest")

    ENV.prepend_create_path "PATH", libexec/"bin"

    mkdir "build" do
      system "cmake", "..", "-DPYTHON_EXPLICIT_VERSION=3", "-DELEMENTS_BUILD_TESTS=OFF", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system bin/"AddCppClass", "--help"
  end
end
