#!/usr/bin/env bash

rm -rf boost_1_69_0

# Get Boost sources first
wget -qO- https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz | tar xvz

# To get the list of binary libraries do:
cd boost_1_69_0/
./bootstrap.sh --show-libraries | grep " - " | awk '{print $2}' | sort > binary_libraries

# To get the list of libraries do:
cd libs
ls -d */ -1 | tr -d '/' > ../all_libraries
cd -

# Subtract binary libraries from all the libraries and edit result to get what you need
grep -vxFf binary_libraries all_libraries > result

# Get Boost binary package for bcp tool, valid for Ubuntu 16.04
#sudo apt install libboost1.58-tools-dev
#     or, a slower alternative:
# Build Boost BCP from binaries
./bootstrap.sh
./b2 tools/bcp

# Strip everything on the second level except the sources itself
cd libs
find . ! -path '*/src*' -type d | grep "/.*/" | xargs rm -rf
cd -

cd ..
