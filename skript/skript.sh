#!/bin/bash

filename="URL.txt"
log="website_status.log"
>"$log"
while IFS= read -r line
do
    if [[ -n "$line" ]]; then
        status=$(curl -s -L --head --request GET "$line" | grep "HTTP/2 200")
        if [[ "$status" == "HTTP/2 200" ]]; then
            echo "<$line> is UP" >> "$log"
        else
            echo "<$line> is Down" >> "$log"
fi
    fi
done < "$filename"
echo "Результати записано у файл логів: $log"
