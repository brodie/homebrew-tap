require 'formula'

class BrodieLibmemcached < Formula
  homepage 'http://libmemcached.org'
  url 'https://launchpad.net/libmemcached/1.0/1.0.16/+download/libmemcached-1.0.16.tar.gz'
  sha1 '6edf8dfde99af0aa0f2acc084c18682bde7c197c'

  depends_on 'memcached'

  def install
    ENV.append_to_cflags "-undefined dynamic_lookup" if MacOS.version <= :leopard

    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  def patches
    if MacOS.version >= :mavericks
      # build fix for tr1 -> std
      DATA
    end
  end

end

__END__
diff --git a/libmemcached-1.0/memcached.h b/libmemcached-1.0/memcached.h
index 3c11f61..dcee395 100644
--- a/libmemcached-1.0/memcached.h
+++ b/libmemcached-1.0/memcached.h
@@ -43,7 +43,11 @@
 #endif
 
 #ifdef __cplusplus
+#ifdef _LIBCPP_VERSION
+#  include <cinttypes>
+#else
 #  include <tr1/cinttypes>
+#endif
 #  include <cstddef>
 #  include <cstdlib>
 #else
