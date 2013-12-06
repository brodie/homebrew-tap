require 'formula'

class BrodieLibgit2 < Formula
  homepage 'http://libgit2.github.com/'
  url 'https://github.com/libgit2/libgit2/archive/1e94df08dad9437164ac7727f23a51591b7c42f4.tar.gz'
  sha1 '0d731cc521a4e05d5b6e9bb6bf05c3d95864b814'

  head 'https://github.com/libgit2/libgit2.git', :branch => 'development'

  depends_on 'cmake' => :build

  def install
    mkdir 'build' do
      system "cmake", "..",
                      "-DBUILD_TESTS=NO",
                      *std_cmake_args
      system "make install"
    end
  end
end
