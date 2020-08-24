#!/bin/bash
parent_path=$(cd `dirname $0`; pwd)

cd $parent_path
if [ ! -d "build" ];then
  mkdir build
else
  echo "dir build already exists"
fi
# chmod +rw $parent_path/build
if [ ! -d "install" ];then
  mkdir install
else
  echo "dir install already exists"
fi

cd abseil-cpp-20200225.2
if [ ! -d "build" ];then
  mkdir build
else
  echo "dir abseil-cpp-20200225.2/build already exists"
fi
cd build
cmake -DCMAKE_INSTALL_PREFIX=$parent_path/install ..
make -j8 -l8
make install

cd $parent_path
cd build
cmake -DCMAKE_INSTALL_PREFIX=$parent_path/install  ..
make -j8 -l8
# make install
