#!/bin/bash

read -p "enter path: " dir

outputfile="ex2.txt"
{	
printf "%-30s %-20s %-50s\n" "File_Name" "File_Extension" "File_Path" 
printf "%-30s %-20s %-50s\n" "------------------------------" "--------------------" "--------------------------------------------------" 


while read -r item; do
    filename=$(basename "$item")
    filepath="$item"
    
    if [ -d "$item" ]; then
        ext=""
    else
        ext="${filename#*.}"
        [ "$ext" == "$filename" ] && ext=""   
    fi
    
    printf "%-30s %-20s %-50s\n" "$filename" "$ext" "$filepath"

done < <(find "$dir") 
} | tee "$outputfile" 

