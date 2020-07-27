#!/bin/bash
#COLOR=$((1+RANDOM%3))$((1+RANDOM%3))$((1+RANDOM%3))
COLOR="113"
urxvt \
	--background-expr "keep \
		{solid \"#$COLOR\"\
	}"
