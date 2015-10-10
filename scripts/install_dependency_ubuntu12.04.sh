mkdir -p temp && cd temp

# glog
wget https://github.com/google/glog/archive/v0.3.4.zip
unzip v0.3.4.zip
cd glog-0.3.4/
./configure && make
eval sudo make install || exit -1
cd ..

# gflags
wget https://github.com/schuhschuh/gflags/archive/master.zip
unzip master.zip
cd gflags-master
mkdir build && cd build
export CXXFLAGS="-fPIC" && cmake .. && make VERBOSE=1
eval make && sudo make install || exit -1
cd ../../

# lmdb
git clone https://github.com/LMDB/lmdb
cd lmdb/libraries/liblmdb
eval make && sudo make install || exit -1
cd -

# remove all temp files and dir
cd .. && rm -rf temp
