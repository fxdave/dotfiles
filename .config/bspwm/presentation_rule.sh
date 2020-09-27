#!/bin/sh

wid=$1
class=$2
instance=$3
consequences=$4

xprop -id "$wid" | grep 'pop-up' && sleep 5

name=$(xtitle "$wid")

[[ "$name" =~ "Előadói nézet -" ]] && echo "desktop=^5"
