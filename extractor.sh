#!/usr/bin/env bash

# Get Boost sources first
wget -qO- https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz | tar xvz

# To get the list of binary libraries do:
cd boost_1_67_0/
./bootstrap.sh --show-libraries | grep " - " | awk '{print $2}' | sort > binary_libraries

# To get the list of libraries do:
cd libs
ls -d */ -1 > all_libraries
cd -

# Subtract binary libraries from all the libraries and edit result to get what you need
grep -vxFf binary_libraries all_libraries > result

# Get Boost binary package for bcp tool 
apt install libboost1.58-tools-dev

# Strip everything on the second level except the sources itself
find . ! -name 'src' -type d | grep "/.*/" | xargs rm -rf

path=/tmp/boost
all_libraries="all_libraries.txt"
header_only_libraries="header_only_libraries.txt"

# Remove previous lists (if any) 
rm $all_libraries $header_only_libraries

# Run bcp for every library and dump libraries with sources and header only libraries
readarray libs < all_libraries 
for i in "${libs[@]}"
do
    rm -rf $path 
    mkdir $path
    bcp $i $path
    echo $i >> $all_libraries
    result=`find $path/libs -name 'src' -type d`
    if [ -n "$result" ]; then
        echo -e $result >> $all_libraries
    else
        echo $i >> $header_only_libraries
    fi
done
