#!/bin/bash

cd ece459-1161-a3

for x in `ls`
do
	cd $x 
	git add a3-mark
	git commit -m "update a3 mark breakdowns"
	git push
	cd ..
done
