#!/bin/bash
url=$1
curl --cookie ./cookie "$url" | tac | tac | xmllint --html --xpath "//div[@class='row']/node()" - 2>/dev/null | head -n -3 > noslot

while true
do
	curl -s --cookie ./cookie "$url" | tac | tac | xmllint --html --xpath "//div[@class='row']/node()" - 2>/dev/null | head -n -3 > tmp
	dif=`diff -sq noslot tmp`
	echo $dif
	if [[ $dif != "Files noslot and tmp are identical" ]]
	then
		notify-send -u critical -t 10 "open slot!"
	fi
	sleep 10
	rm tmp
done
rm noslot
