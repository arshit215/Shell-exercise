#!/bin/bash

x=','

if [[ -n "$1" ]]; then 
    filename="$1" 
else 
    filename="data.csv" 
fi 

while read line
do
        echo "$line$x" 
done < $filename

echo
header=$(head -1 "$filename")

echo "$header" | tr ' ' '\n' > temp.csv

csv_func(){
    local file="$1"
    files=("no.csv" "name.csv" "role.csv" "type.csv" "salary.csv")

    for i in {1..5}
    do
        awk -v col="$i" '{print $col}' "$file" > "${files[i-1]}"
    done
}

:<<'end'
csv_func(){
local file="$1"
files=("no.csv" "name.csv" "role.csv" "type.csv" "salary.csv")


for i in {1..5}; 
do
    echo $i 
    awk '{print $i}' data.csv > "${files[i-1]}"
done
}
end
csv_func "$filename"
