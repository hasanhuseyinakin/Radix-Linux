tar -xvf /toolchain-tools/binutils-2.45.tar.xz
echo " The extraction process completed! " 
sleep 3
cd binutils-2.45.tar.xz
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
echo " The configuration is ready for compilation! "
sleep 4
make
echo " The source code has been compiled! "
sleep 3
make install
echo " The Binutils package has been compiled! "
sleep 2 
cd ../.. 
rm -Rf binutils-2.45
echo " The build sources has been cleaned up! "
