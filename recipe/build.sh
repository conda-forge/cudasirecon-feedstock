#!/bin/bash
if [ ! -d "src/IVE" ] 
then
    wget src/ https://www.dropbox.com/s/2twvw0go3dr3aim/IVE.zip
    echo "IVE downloaded"
    unzip -o -d src IVE.zip
    echo "IVE unzipped"
    rm IVE.zip
    echo "IVE.zip removed"
fi
mkdir cmake_build
cd cmake_build

CXXFLAGS="$CXXFLAGS -Wno-deprecated-declarations"
cmake ${CMAKE_ARGS} \
    -DBUILD_MRC=ON \
    -DBUILD_OTF_VIEWER=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    ../src

make -j${CPU_COUNT}
make install
