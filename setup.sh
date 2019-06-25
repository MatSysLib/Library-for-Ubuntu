#!/bin/bash
sudo apt update
sudo apt install g++ gfortran mpich freeglut3 freeglut3-dev cmake emacs25 libgsl0-dev libxmu-dev libxi-dev libmpich-dev
cp ./.emacs $HOME/
cp -R ./.emacs.d $HOME/
cd ./NumLib/Build/Release/
if [ -e CMakeCache.txt ]
then
rm CMakeCache.txt
fi
sh ./build.sh
mkdir -p $HOME/.local/share/Library/
cp ./inc/*.mod $HOME/.local/share/Library
cp ./lib/*.a $HOME/.local/share/Library
cd ../../../
cd Plot/
rm -rf ./build
mkdir -p build
cd build
cmake ..
make
cp -R ./inc/* $HOME/.local/share/Library/
cp ./lib/* $HOME/.local/share/Library/
cd ../../
echo "Система успешно установлена"
if ! grep -q 'export LIBRARY_PATH=$LIBRARY_PATH:"$HOME/.local/share/Library/"' $HOME/.bashrc;
then echo 'export LIBRARY_PATH=$LIBRARY_PATH:"$HOME/.local/share/Library/"' >> $HOME/.bashrc
fi


