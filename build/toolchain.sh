cd ../toolchain-tools
tar -xvf binutils-2.45.tar.xz
echo " The extraction process completed! " 
sleep 3
cd binutils-2.45
mkdir -v build
cd       build

../configure --prefix=$Radix/tools \
             --with-sysroot=$Radix \
             --target=$Radix_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror    \
             --enable-new-dtags  \
             --enable-default-hash-style=gnu
echo " The configuration is now loaded! "
sleep 4
make
echo "
 The source code has been compiled! "
sleep 4
make install
echo "
 The Binutils package has been installed! "
sleep 4 
cd ../.. 
rm -Rf binutils-2.45
echo "
 The build sources has been cleaned up! "

tar -xvf gcc-15.2.0.tar.xz
echo "
 The extraction process completed! "
sleep 4
cd gcc-15.2.0
tar -xvf ../mpfr-4.2.2.tar.xz
mv -v mpfr-4.2.2 mpfr
tar -xvf ../gmp-6.3.0.tar.xz
mv -v gmp-6.3.0 gmp
tar -xvf ../mpc-1.3.1.tar.gz
mv -v mpc-1.3.1 mpc

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac

mkdir -v build
cd build

../configure                  \
    --target=$Radix_TGT       \
    --prefix=$Radix/tools     \
    --with-glibc-version=2.42 \
    --with-sysroot=$Radix     \
    --with-newlib             \
    --without-headers         \
    --enable-default-pie      \
    --enable-default-ssp      \
    --disable-nls             \
    --disable-shared          \
    --disable-multilib        \
    --disable-threads         \
    --disable-libatomic       \
    --disable-libgomp         \
    --disable-libquadmath     \
    --disable-libssp          \
    --disable-libvtv          \
    --disable-libstdcxx       \
    --enable-languages=c,c++
echo "
 The configuration is now loaded! "
sleep 4
make
echo " The source code has been compiled! "
sleep 4
make install
cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($Radix_TGT-gcc -print-libgcc-file-name)`/include/limits.h

echo " The Gcc package has been installed! "
sleep 4
cd ..
rm -Rf gcc-15.2.0
echo "The build sources has been cleaned up! "

tar -xvf glibc-2.42.tar.xz
echo "
the extraction process completed! "
sleep 3
cd glibc-2.42

case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $Radix/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $Radix/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $Radix/lib64/ld-lsb-x86-64.so.3
    ;;
esac
patch -Np1 -i ../glibc-2.42-fhs-1.patch
mkdir -v build
cd build

echo "rootsbindir=/usr/sbin" > configparms
../configure                             \
      --prefix=/usr                      \
      --host=$Radix_TGT                  \
      --build=$(../scripts/config.guess) \
      --disable-nscd                     \
      libc_cv_slibdir=/usr/lib           \
      --enable-kernel=5.4
echo "
The configuration is now loaded! "
sleep 3
make
echo "
The source code is now compiled! "
make DESTDIR=$Radix install
sed '/RTLDLIST=/s@/usr@@g' -i $Radix/usr/bin/ldd
echo 'int main(){}' | $Radix_TGT-gcc -x c - -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'
grep -E -o "$Radix/lib.*/S?crt[1in].*succeeded" dummy.log
grep -B3 "^ $Radix/usr/include" dummy.log
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
grep "/lib.*/libc.so.6 " dummy.log
grep found dummy.log
rm -v a.out dummy.log
echo " 
The glibc-2.42 package successfully installed! "
sleep 5
cd ..
rm -Rf glibc-2.42
echo " 
The unnecessary packages removed!"

    
