#!/bin/bash
month=$(date -R |awk '{print $3;}') #month with english version

#[15/Dec/2017:11:29:01 +0100]
#echo $(date  +"[%d/$month")
#echo "[$month"







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







#echo $today
echo $specific
echo $number_line
