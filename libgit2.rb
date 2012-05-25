require 'formula'

class Libgit2 < Formula
  homepage 'http://libgit2.github.com/'
  url 'https://bitbucket.org/brodie/libgit2/get/682408110fb6fb02b55a91654254f2c187a47f06.tar.gz'
  md5 'f0519d70fb670510d0ffb802ec4d9e4f'

  head 'https://github.com/libgit2/libgit2.git', :branch => 'master'

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
