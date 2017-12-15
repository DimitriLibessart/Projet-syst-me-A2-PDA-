#!/bin/bash
ligne=2
number_line=$(echo $digit|wc -l)
echo $number_line

while [ $ligne -lt $number_line ]
do
        $digit=$(echo $today|head -n $number_line|tail -n 1)
	hourDigit=$(echo $digit|sed -r 's/.*(.{6})/\1/'|sed -r 's/(.{2}).*/\1/')
	minuteDigit=$(echo $digit|sed -r 's/.*(.{6})/\1/'|sed -r 's/(.{2}).*/\1/')
	let "nbrHost=hourHost*60+minuteHost"
	let "nbrDigit=hourDigit*60+minuteDigit"
	let "result=nbrHost-nbrDigit"
		if [ $result -le 60 ]
			then
        			echo $today|head -n $number_line|tail -n 1 >> address.csv


		fi
	let 'ligne=ligne+1'
done
