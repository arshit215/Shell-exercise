#!/bin/bash

read -p "enter principal amount : " p
read -p "enter rate of interest : " r
read -p "enter time : " t1 

si=$(echo "$p * $r * $t1 / 100" | bc -l)

ci=$(echo "$p*((1 + $r/100)^$t1 - 1)" | bc -l)

printf "\nSI: %.2f\n" "$si"
printf "CI: %.2f\n" "$ci"

