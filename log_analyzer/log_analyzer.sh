#/bin/bash

echo -e "Top 5 IP addresses with the most requests:"

echo -e "$(cat nginx-access.log | awk '{print $1}' | sort | uniq -c | sort -r | head -n 5 | awk '{print $2 " - " $1 " requests"}')"

echo -e "\nTop 5 most requested paths:"

echo "$(cat nginx-access.log | awk '{print $7}' | sort | uniq -c | grep "/" | sort -r | head -n 5 | awk '{print $2 " - " $1 " requests"}')"

echo -e "\nTop 5 returned status codes:"

echo "$(cat nginx-access.log | grep "GET\|POST\|PATCH\|OPTIONS" | awk '{print $9}' | sort |uniq -c | sort -r | head -n 5 | awk '{print $2 " - " $1 " requests"}')"

echo -e "\nTop 5 return user agents:"

echo "$(cat nginx-access.log | awk -F\" '{print $6}' | grep "Mozilla" | sort | uniq -c | sort -r | head -n 5 | awk '{print $2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "$(10)" "$(11)" "$(12)" "$(13) " - "$1 " requests"}')"
