#!/bin/bash
export FILENAME=$1
export FILENAME=`echo $FILENAME | sed "s/.$2//"`
xsltproc $LOCATION/converter.xsl "$FILENAME"."$2" >"$FILENAME".txt
export USERNAME=`echo $FILENAME | cut -f1 -d" " `
sed -i "" -e '1d' -e "s/WETWETHWEIUGTWIEUG/$USERNAME/" "$FILENAME.txt"
export NEWFILENAME=`echo $FILENAME | cut -f2 -d"("|cut -f1 -d")" | sed "s/\.//g" | sed "s/T/\./"`
export TIMEZONE=`echo $NEWFILENAME | cut -f4 -d"-"`
if [ "$TIMEZONE" == "0400" ]
	then
		export NEWFILENAME=${NEWFILENAME}EDT
fi
if [ "$TIMEZONE" == "0700" ]
	then
		export NEWFILENAME=${NEWFILENAME}PDT
fi
mv "$FILENAME.txt" "$NEWFILENAME.txt"
if [ "$2" == "xml" ]
	then
		mv "$NEWFILENAME.txt" ..
fi