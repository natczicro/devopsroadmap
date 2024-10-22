#/bin/bash

echo -e "Top 5 IP addresses with the most requests:"

echo -e "$(cat nginx-access.log | awk '{print $1}' | sort | uniq -c | sort -r | head -n 5 | awk '{print $2 " - " $1 " requests"}')"
