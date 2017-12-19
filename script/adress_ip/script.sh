#!/bin/bash



###################################################################grep date


###
#month with english version
###
month=$(date -R |awk '{print $3;}')


###
#test if lines contains today's dates
###
cat access.log |grep $(date  +"%d/$month/%Y")> date.txt



####scan lines per lines
input="date.txt"
while IFS= read -r var
do


	digit=$(echo $var|awk '{print $4;}'| sed 's/[^0-9]//g')
	hourDigit=$(echo $digit|sed -r 's/.*(.{6})/\1/'|sed -r 's/(.{2}).*/\1/')
	minuteDigit=$(echo $digit|sed -r 's/.*(.{4})/\1/'|sed -r 's/(.{2}).*/\1/')
	hourHost=$(date +"%H")
	minuteHost=$(date +"%M")
	let "nbrHost=hourHost*60+minuteHost"
	let "nbrDigit=hourDigit*60+minuteDigit"
	let "result=nbrHost-nbrDigit"
	echo "host " $nbrHost
	echo "digit " $nbrDigit
	echo "result " $result

	if [ $result -le 60 ]
                        then

                              echo -n $(echo $var|awk '{print $1;}') >> address.csv

				ip=$(echo $var|awk '{print $1;}')
				echo -n "," >>address.csv
				echo  $(curl -s 'http://ip-api.com/json/'$ip'' |jq -r '.country') >> address.csv
				

        fi



done < "$input"














