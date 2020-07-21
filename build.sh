#!/bin/bash

export LOCAL_BIN_ROOT=$HOME/shared_dir/bin
export LOCAL_LIB_ROOT=$HOME/shared_dir/lib
export LOCAL_INCLUDE_ROOT=$HOME/shared_dir/include

export PATH=$LOCAL_BIN_ROOT:$PATH
export LD_LIBRARY_PATH=$LOCAL_LIB_ROOT:$LD_LIBRARY_PATH

cd build
cmake ..
make -j8 -l8


