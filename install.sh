#!/bin/bash

if [[ $(basename "$PWD") != "kwallet-runner"* ]];then
    git clone https://github.com/alex1701c/kwallet-runner
    cd kwallet-runner/
fi

mkdir -p build
cd build

cmake -DQT_PLUGIN_INSTALL_DIR=`kf5-config --qt-plugins` -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc)
sudo make install

quitapp5 krunner 2> /dev/null
kstart5 --windowclass krunner krunner > /dev/null 2>&1 &

echo "Installation finished !";