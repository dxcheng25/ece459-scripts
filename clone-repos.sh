#!/bin/bash

mkdir -p "ece459-1161-a4"
cd ece459-1161-a4

for x in `cat ../watids-1161.txt`
do 
	git clone git@ecgit.uwaterloo.ca:ece459/1161/$x/a4 $x
done
