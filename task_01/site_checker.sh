#!/usr/bin/env bash

logfile="website_status.log"
site_list="sites.txt"
array=($(cat $site_list | sed 's/, /\n/g'))
date=$(date +%y/%m/%d_%H:%M:%S)

echo -e "\nПочинаю перевірку станом на $date" | tee -a $logfile

for item in "${array[@]}"; do
    status=$(curl -s -L --head --request GET $item | grep "HTTP/2 200")
    if [ -n "$status" ];
    then
        result="$item is UP"
    else
        result="$item is DOWN"
    fi
    echo "$result" | tee -a $logfile
done

echo "Перевірку завершено. Результати записано у $logfile"