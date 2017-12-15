#!/bin/bash

cat  access.log |awk '{print $4;}' > date.log.txt
cat date.log.txt | sed 's/[^0-9]//g'|awk '{print $1;}' >just-digit.txt



first=$(cat just-digit.txt |sed -r 's/(.{2}).*/\1/')
echo $first |awk '{print $1;}'

#if [ $first -eq 15 ]
#then
#        echo "Vous avez envoyé 20 ou plus"
#else
#        echo "Vous avez envoyé moins de 20"
#fi
