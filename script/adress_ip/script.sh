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
minuteDigit=$(echo $digit|sed -r 's/.*(.{4})/\1/'|sed -r 's/(.{2}).*/\1/')

###
#hour minutes from host
###
hourHost=$(date +"%H")
minuteHost=$(date +"%M")


###
#convert hour:minutes into minutes
###
let "nbrHost=hourHost*60+minuteHost"
let "nbrDigit=hourDigit*60+minuteDigit"





###
#display the number of line
###
number_line=$(cat -b access.log |awk '{print $1;}'|tail -n 1)


wanted_line=12;

###
#display specific line
###

specific=$(cat -b access.log |head -n $wanted_line|tail -n 1)







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

