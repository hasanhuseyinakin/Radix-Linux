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


    
