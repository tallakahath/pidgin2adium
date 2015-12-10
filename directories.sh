#!/bin/bash
export DIRECTORY=$1
export TYPE=`echo $DIRECTORY | cut -f1 -d"."`
export SCREENNAME=`echo $DIRECTORY | cut -f2 -d"."`
export TYPE=`echo $TYPE | tr [:upper:] [:lower:] `
mkdir -p "$TYPE"
mv "$DIRECTORY" "$TYPE"/"$SCREENNAME"
echo $SCREENNAME