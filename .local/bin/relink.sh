#!/usr/bin/sh

# relink all links in DIR substituting EXPR1 with EXPR2
# the script at the end needs to be EXPLICITLY executed
DIR=$1
EXPR1=$2
EXPR2=$3

OUTPUTSCRIPTDIR="$HOME/.local/bin/"
OUTPUTSCRIPTFILE="relink-exec.sh"
OUTPUTSCRIPTPATH=$OUTPUTSCRIPTDIR$OUTPUTSCRIPTFILE

find $DIR -type l -printf 'ln -nsf $(readlink %p | sed s/'$EXPR1'/'$EXPR2'/) $(echo %p | sed s/'$EXPR1'/'$EXPR2'/)\n' > $OUTPUTSCRIPTPATH &&

# cat $OUTPUTSCRIPT
# chmod +x $OUTPUTSCRIPTPATH &&
# exec $OUTPUSCRIPTPATH &&
# ls -l $OUTPUTSCRIPTDIR
# ls -l
# rm $OUTPUTSCRIPT
# find $DIR -type l -exec ln -snf $(readlink '{}') \;
