#!/usr/bin/fish

set REPORT (ls -t "Downloads" | grep "Clockify_Time_Report_Weekly" | grep ".csv" | head -n 1)
set FILE "Downloads/$REPORT"
echo "Using report $FILE"

if test (cat $FILE | wc -l) -gt 2
	echo "WRONG EXPORT"
	exit 1
end

set TIMES (
	cat $FILE |
	tail -n 1 |
	cut -d',' -f4,5,6,7,8,9,10,11,12,13,14,15 --output-delimiter=\n |
	replace '"' ''
)

set DAYS Monday Tuesday Wednesday Thursday Friday Saturday Sunday "Weekly total hours"

set c 1
for time in $TIMES
	set hrs (echo $time | cut -d':' -f1)
	set mins (echo $time | cut -d':' -f2)
	echo $DAYS[$c]":" (printf '%.2f' (math "$hrs + $mins/60")) hours
	set c (math "$c+1")
end
