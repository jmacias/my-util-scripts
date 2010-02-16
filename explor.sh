#!/bin/bash
# I have called this script "explor" in my bin dir.
usage ()
{
 echo "Open Windows Explorer"
 echo "Usage: $0 [-help] [path]"
 echo "          [path]: folder at which to open Windows Explorer, will"
 echo "              default to current dir if not supplied."
 echo "          [-help] Display help (this message)."
}


location=.
case "$1" in
 ""                 ) location=.;;
 "-help"            ) usage; exit 0;;
 *                  ) location="${1}";;
esac

if [ -e "$location" ]
then
	#echo `cygpath -w -a "${location}"`
	location=`cygpath -d -a "${location}"`
	#echo "$location"
	/bin/explor.bat "$location" &
#/bin/explor.bat location &
 #/bin/explor.bat `cygpath -w -a "${location}"` &
 #/cygdrive/c/WINDOWS/r,`cygpath -w -a "${location}"` &   /bin/explor.bat `cygpath -w -a "."` 
else
 echo ${location} does not exist!
 exit 2
fi
