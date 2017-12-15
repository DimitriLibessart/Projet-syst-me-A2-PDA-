#!/bin/bash
ligne=2
number_line=$(echo $digit|wc -l)
echo $number_line

while [ $ligne -lt $number_line ]
do
        echo "d"
	let 'ligne=ligne+1'
done
