echo "Configuring and building Thirdparty/DBoW3 ..."

cd Thirdparty/DBoW3
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j

cd ../../g2o

echo "Configuring and building Thirdparty/g2o ..."

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j

cd ../../../

# echo "Uncompress vocabulary ..."
# cd Vocabulary
# tar -xf ORBvoc.txt.tar.gz
# cd ..

echo "Configuring and building SuperPoint_SLAM ..."

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/root/SuperPoint_SLAM/Thirdparty/libtorch ..
make -j
