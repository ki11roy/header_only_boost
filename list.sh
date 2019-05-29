#!/usr/bin/env bash

pwd=`pwd`
boost=boost_1_69_0
bcp=./dist/bin/bcp
path=$pwd/boost
all_libraries="all_libraries.txt"
header_only_libraries="header_only_libraries.txt"
cd $boost

# Remove previous lists (if any)
rm $all_libraries $header_only_libraries

# Run bcp for every library and dump libraries with sources and header only libraries
readarray libs < all_libraries
for i in "${libs[@]}"
do
    rm -rf $path
    mkdir $path
    $bcp $i $path
    echo $bcp $i $path
    echo $i >> $all_libraries
    size=`du -hs $path | awk '{print $1}'`
    result=`find $path/libs -name 'src' -type d`
    if [ -n "$result" ]; then
        echo -e $size $result >> $all_libraries
    else
        echo $i $size >> $header_only_libraries
    fi
done

mv $all_libraries $header_only_libraries ..
cd -
