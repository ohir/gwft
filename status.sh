#!/bin/bash
for d in app protocol client server; do
	echo "----- checking $d ------"
	if [ -f ./$d/stamp.go ]; then
		cd $d
		git status
		cd ..
	fi
done
