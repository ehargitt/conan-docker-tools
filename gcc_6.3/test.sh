#!/usr/bin/env bash
sudo docker run -t -d --name gcc63 conanio/gcc63 && \
sudo docker exec gcc63 sudo pip install -U conan_package_tools && \
sudo docker exec gcc63 sudo pip install -U conan && \
sudo docker exec gcc63 conan user && \
sudo docker exec gcc63 conan install gtest/1.8.0@bincrafters/stable -s arch=x86_64 -s compiler=gcc -s compiler.version=6.3 -s compiler.libcxx=libstdc++ --build && \
sudo docker exec gcc63 conan install gtest/1.8.0@bincrafters/stable -s arch=x86 -s compiler=gcc -s compiler.version=6.3 -s compiler.libcxx=libstdc++ --build && \
sudo docker stop gcc63 && \
sudo docker rm gcc63
