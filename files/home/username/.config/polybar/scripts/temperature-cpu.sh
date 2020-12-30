#!/bin/bash

# Calculate the average temperature

temperatures=($(sensors|grep Core|awk '{print $3}'))
sum_average=0
num_core=${#temperatures[@]}

temperaturesValues=(40 50 60 70 80 90)
temperaturesColors=("#8ec07c" "#b8bb26" "#fabf2f" "#fe8019" "#fb4934" "#d3869d")
temperaturesIcons=(     )

for t in ${temperatures[*]}
do
	sum_average=$((sum_average + ${t:1:2}))
done

# averge=$(awk -v av=$sum_average -v n_c=$num_core "BEGIN {print av / n_c}")
# echo $averge
average=$((sum_average / num_core))
result=""

if (($average < ${temperaturesValues[0]})); then
	result="%{F${temperaturesColors[0]}}$average°C ${temperaturesIcons[0]}%{F-}"

elif (($average < ${temperaturesValues[1]})); then
	result="%{F${temperaturesColors[1]}}$average°C ${temperaturesIcons[0]}%{F-}"

elif (($average < ${temperaturesValues[2]})); then
	result="%{F${temperaturesColors[2]}}$average°C ${temperaturesIcons[0]}%{F-}"

elif (($average < ${temperaturesValues[3]})); then
	result="%{F${temperaturesColors[3]}}$average°C ${temperaturesIcons[0]}%{F-}"

elif (($average < ${temperaturesValues[4]})); then
	result="%{F${temperaturesColors[4]}}$average°C ${temperaturesIcons[0]}%{F-}"

else
	result="%{F${temperaturesColors[5]}}$average°C ${temperaturesIcons[0]}%{F-}"
fi

# echo $average
echo $result

