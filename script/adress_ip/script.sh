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

	###print access.log's line in numeric mode 
	digit=$(echo $var|awk '{print $4;}'| sed 's/[^0-9]//g')

	###extract hour from this digit line
	hourDigit=$(echo $digit|sed -r 's/.*(.{6})/\1/'|sed -r 's/(.{2}).*/\1/')

	###extract minute from this digit line
	minuteDigit=$(echo $digit|sed -r 's/.*(.{4})/\1/'|sed -r 's/(.{2}).*/\1/')

	###extract hour from host with same format that digit 
	hourHost=$(date +"%H")

	###extract minute from host with same format that digit
	minuteHost=$(date +"%M")

	###convert hour & minute to minutes
	let "nbrHost=hourHost*60+minuteHost"
	let "nbrDigit=hourDigit*60+minuteDigit"
	let "result=nbrHost-nbrDigit"
	
	#if the difference of date lower or egal than 60 minutes (1hour)

	if [ $result -le 60 ]
                        then
				##print ip address in address.csv 
                              echo -n $(echo $var|awk '{print $1;}') >> address.csv

				ip=$(echo $var|awk '{print $1;}')
				### add comma to respect csv 's syntax
				echo -n "," >>address.csv
				###curl and parse from api
				echo  $(curl -s 'http://ip-api.com/json/'$ip'' |jq -r '.country') >> address.csv
				

        fi



done < "$input"














