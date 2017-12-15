#!/bin/bash


###
#month with english version
###
month=$(date -R |awk '{print $3;}')


###
#test if lines contains today's dates
###
today=$(cat access.log |grep $(date  +"%d/$month/%Y"))


###
#convert good log to date
###
digit=$(echo $today |awk '{print $4;}'| sed 's/[^0-9]//g')



###
#show hour of log
###
hourDigit=$(echo $digit|sed -r 's/.*(.{6})/\1/'|sed -r 's/(.{2}).*/\1/')
minuteDigit=$(echo $digit|sed -r 's/.*(.{6})/\1/'|sed -r 's/(.{2}).*/\1/')

###
#hour minutes from host
###
hourHost=$(date +"%H")
minuteHost=$(date +"%M")


###
#convert hour:minutes into minutes
###
let "nbrDigit=hourHost*60+minuteHost"
let "nbrDigit=hourHost*60+minuteHost"





###
#display the number of line
###
number_line=$(cat -b access.log |awk '{print $1;}'|tail -n 1)


wanted_line=12;

###
#display specific line
###

specific=$(cat -b access.log |head -n $wanted_line|tail -n 1)



###
#test if lines contains today's dates
###
today=$(cat access.log |grep $(date  +"%d/$month"))


###
#show hour of log
###
#sed -r 's/.*(.{6})/\1/' just-digit.txt|sed -r 's/(.{2}).*/\1/'




#echo $today
echo $specific
echo $number_line

###
#rebus
###

#[15/Dec/2017:11:29:01 +0100]
#echo $(date  +"[%d/$month")
#echo "[$month"

