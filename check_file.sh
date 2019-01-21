#!/usr/bin/env bash


FILE_NAME="DevOps_Lab"
DATE="$(date +%Y_%m_%d)"
NAME="$USER"
LAST_NAME=$(grep $NAME /etc/passwd | cut -d ":" -f5 | cut -d " " -f2)

if [[ $# -gt 0 ]]
then
	FILE_NAME="$1"
else
	printf "you did not pass any parameter to script, so we will be the use default name: %s\n" "$FILE_NAME"
fi

if [[ -f $FILE_NAME ]]
then
	echo $NAME >> $FILE_NAME
else
	touch $FILE_NAME
	echo $NAME >> $FILE_NAME && echo "date of create $DATE" >> $FILE_NAME
fi

if [[ -n $LAST_NAME ]]
then
	tar czf ${FILE_NAME}_${LAST_NAME}.tar.gz $FILE_NAME
else
	print "There is no last name, so we will be to use user name: %s, insted LAST NAME\n" "$NAME"
	tar czf ${FILE_NAME}_${NAME}.tar.gz $FILE_NAME
fi


