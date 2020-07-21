# cmake_apollo_hdmap
Apollo HDMap SDK compiled with cmake.



## dep
```
sudo apt-get install autoconf automake libtool curl make g++ unzip
```
+ protobuf-3.3.0: compile with source
```
./autogen.sh
./configure --prefix=/home/phy/shared_dir/opt
make -j8 -l8
sudo make install 
sudo ldconfig
```
+ proj.4-4.9.3: compile with source
```
./autogen.sh
./configure --prefix=/home/phy/shared_dir/opt
make -j8 -l8
sudo make install 
sudo ldconfig
```
+ tinyxml2-5.0.1: compile with source
```
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/home/phy/shared_dir/opt  ..
make 
make install
```