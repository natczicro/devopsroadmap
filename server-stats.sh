#!/bin/bash

echo "CPU Usage with vmstat 1 2"
echo "CPU Usage: "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%"

echo -e "\nCPU Usage with /proc/stat"
echo "$(cat /proc/stat |grep cpu |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "CPU Usage: " 100-$1}')"

echo -e "\nCPU Usage with top"
echo "$(top -bn2 | grep "Cpu" | tail -1 | awk '{print "CPU Usage: " 100-$8 "%"}')"

echo -e "\nMemory usage with free"
echo "$(free -m | grep "Mem" | awk '{print "Total = " $2 "MB\nUsed = " $3 "MB\nFree = "$4 "MB\nPercent = " $3/$2*100}')"

echo -e "\nDisk usage with df -H"
echo "$(df -H /mnt/c/ | grep "C:" | awk '{print "Total="$2 "\nUsed=" $3 "\nAvailable=" $4 "\nPercent Used=" $5}')"

echo -e "\nTop Five CPU with ps aux"
echo "$(ps aux | sort -nrk 3 | head -n 5)"

echo -e "\nTop Five Memory with ps aux"
echo "$(ps aux | sort -nrk 4 | head -n 5)"
