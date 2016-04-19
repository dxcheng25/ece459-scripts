#!/bin/bash

ASSIGNMENT_DIRECTORY="ece459-1161-a4"
DUE_DATE="2016-04-04 23:59:59 -0400"
MARK_DATE="2016-04-09 00:00:00 -0400"
WATID_TXT="/home/x22cheng/watids-1161.txt"
DATETIME_FORMAT="%Y-%m-%d %H:%M:%S %z"

cd $ASSIGNMENT_DIRECTORY

datediff() {
  d1=$(date -d "$1")
  d2=$(date -d "$2")
  echo $(( (d1 - d2) )) days
}

for x in `cat $WATID_TXT`
do 
	cd $x
	LAST_COMMIT_DATE_AFTER_DUE=`git log -1 --after="$DUE_DATE" --before="$MARK_DATE" --format="%ci"`
	if [ `echo $LAST_COMMIT_DATE_AFTER_DUE | wc -w` -gt 0 ]
	then
	    LATENESS=`python -c "from datetime import datetime, timezone, timedelta; print((datetime.strptime(\"$LAST_COMMIT_DATE_AFTER_DUE\", \"$DATETIME_FORMAT\").astimezone(tz=timezone(timedelta(hours=-4))).date()-datetime.strptime(\"$DUE_DATE\", \"$DATETIME_FORMAT\").astimezone(tz=timezone(timedelta(hours=-4))).date()).days)";`
		echo "$x, $LATENESS, $LAST_COMMIT_DATE_AFTER_DUE"
	fi
	 	
	cd ..
done
