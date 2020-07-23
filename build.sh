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

# export LOCAL_BIN_ROOT=$HOME/shared_dir/opt/bin
# export LOCAL_LIB_ROOT=$HOME/shared_dir/opt/lib
# export LOCAL_INCLUDE_ROOT=$HOME/shared_dir/opt/include
# export PATH=$LOCAL_BIN_ROOT:$PATH
# export LD_LIBRARY_PATH=$LOCAL_LIB_ROOT:$LD_LIBRARY_PATH
# export C_INCLUDE_PATH=$LOCAL_INCLUDE_ROOT:$C_INCLUDE_PATH
# export CPLUS_INCLUDE_PATH=$LOCAL_INCLUDE_ROOT:$CPLUS_INCLUDE_PATH
# export CPATH=$LOCAL_INCLUDE_ROOT:$CPATH

cd build
cmake -DCMAKE_INSTALL_PREFIX=$parent_path/install  ..
make -j8 -l8
make install
