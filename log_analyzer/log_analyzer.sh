#/bin/bash

echo -e "Top 5 IP addresses with the most requests:"

echo -e "$(cat nginx-access.log | awk '{print $1}' | sort | uniq -c | sort -r | head -n 5 | awk '{print $2 " - " $1 " requests"}')"

echo -e "\nTop 5 most requested paths:"

echo "$(cat nginx-access.log | awk '{print $7}' | sort | uniq -c | grep "/" | sort -r | head -n 5 | awk '{print $2 " - " $1 " requests"}')"
