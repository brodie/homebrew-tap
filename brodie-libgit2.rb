require 'formula'

class BrodieLibgit2 < Formula
  homepage 'http://libgit2.github.com/'
  url 'https://github.com/libgit2/libgit2/archive/cc3d961bd949f11ad90fd4bb513bbc089f6cb61a.tar.gz'
  sha1 '14056735930fbef84820651b22931ec1c276fb82'

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
