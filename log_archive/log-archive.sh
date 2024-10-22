#/bin/bash

echo -e "compressing all.log files in $1\n\n"

tar -czvf "$1logs_archive_$(date +'%Y-%m-%d_%H%M%S').tar.gz" $1*.log 
