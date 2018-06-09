#!/usr/bin/env bash
pwd=`pwd`
boost=boost_1_67_0
bcp=./dist/bin/bcp
path=$pwd/boost

rm -rf $path
mkdir $path 

result=`cat header_only_libraries.txt | paste -s -d' '`

cd $boost
$bcp $result $path 
cd -
