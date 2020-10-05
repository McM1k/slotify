#!/bin/bash
url=$1
curl --cookie ./cookie "$url" | tac | tac | xmllint --html --xpath "//div[@class='row']/node()" noslot 2>/dev/null | head -n -3 >~/noslot
while true
do
	sleep 10
	curl --cookie ./cookie "$url" | tac | tac | xmllint --html --xpath "//div[@class='row']/node()" noslot 2>/dev/null | head -n -3 >~/tmp
	if [[ `diff -q noslot tmp` != "" ]]
	then
		notify-send -u critical -t 10 "open slot!"
	fi
	rm tmp
done
rm noslot
