class Tcpflow < Formula
    desc "TCP flow recorder"
    homepage "https://github.com/simsong/tcpflow"
    url "https://github.com/simsong/tcpflow/archive/tcpflow-1.5.0alpha.tar.gz"
    sha256 "ea5467880cd1ea56f2567f97db12bdcebcf5bfb722b6580a6d3ce3acf641a4f1"
  
    bottle do
      cellar :any
      sha256 "c971d3d993660862b690239940e4c84d5fd8bffdff776ccba4c038d1eba76169" => :high_sierra
      sha256 "ff6d43a7c67853c6f7a4ffbe9290028a179f0d722e8075395c1f133386778fe7" => :sierra
      sha256 "ea92e38288a2fea16c85b9a937951b8ecc0c5ca619ccff050d36590866543356" => :el_capitan
      sha256 "d5e07b6218d3160b27d12e154910286af4f3edbbbc70fe5879852849a046cfae" => :yosemite
      sha256 "b0e5f0a0e6f6fc81be55627483028a578a679d1c342a7127aa3a983983acef1a" => :mavericks
    end
  
    head do
      url "https://github.com/simsong/tcpflow.git"
      depends_on "autoconf" => :build
      depends_on "automake" => :build
      depends_on "libtool" => :build
    end
  
    depends_on "boost" => :build
    depends_on "sqlite" if MacOS.version < :lion
    depends_on "openssl"
  
    def install
      system "bash", "./bootstrap.sh" if build.head?
      system "./configure", "--disable-dependency-tracking",
                            "--prefix=#{prefix}",
                            "--mandir=#{man}"
      system "make", "install"
    end
  end