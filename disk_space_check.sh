#!/bin/bash

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Welcome To My Script $(who | awk '{print $1}')~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
echo " "

echo "--------------------------T-------Today is $(date | awk '{print $1,$2,$3,$4}')-----------------------------------"


echo "----------------------------------Time is $(date | awk '{print $5}')--------------------------------------------------"


echo "----------------------------------Machine running up from $(uptime | awk '{print $3,$4,"with",$5,$6}')----------------------"
echo " "
echo " "

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Last 5 User Login Details~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
echo " "

last -a | head -5

echo " "

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Disk Space and RAM Utilization~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
 df -H | xargs | awk '{print "Disk Space Available:" "Free/Used:" $10,"/",$9}' && echo "Ram Available: $(free -h)"

echo " "


echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Top CPU Processes~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
top | head

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Thanks for Reading :) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
