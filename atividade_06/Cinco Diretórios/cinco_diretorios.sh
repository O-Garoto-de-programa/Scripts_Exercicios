#!/bin/bash

mkdir ./cinco

for i in $(seq 5); do
	mkdir ./cinco/dir$i
	for x in $(seq 4);do
		touch ./cinco/dir$i/arq$x.txt
		for y in $(seq 1 $x); do
			echo $x >> ./cinco/dir$i/arq$x.txt
		done
	done
done
