#!/bin/bash
# Crastinator Pro v1.0 by Anatoly Spitkovsky 
# Send bug reports to anatoly@princeton.edu
# Don't waste your life on stupid browsing!

firstwarning=120 #150 # seconds
remindinterval=60 # seconds
finaltime=360 #seconds; after this, harassment is non-stop. 
interval=5  #how often to check the foreground app

#Canned responses. Should be increasingly off-the-wall. 
responses=([1]="Stop procrastinating" [2]="You are wasting your time" [3]="Allright, back to work!" [4]="You could be working right now" [5]="Be productive!" [6]="Take a break" [7]="Beep!" [8]="Be-beep!" [9]="Stop it!")

maxphrases=${#responses[@]}
counter=0
selection=3 # choose from first $selection phrases in the beginning, 
            # increase selection with time

while :   #very infinite loop
do

sleep $interval

#get the name of the foreground application
a=`osascript -e 'tell application "System Events"' -e 'set frontApp to name of first application process whose frontmost is true' -e 'end tell'`

echo "Foreground app is " $a

if [ "$a" = "Safari" -o "$a" = "Firefox" -o "$a" = "Google Chrome" ]; then 
let "counter=counter+1"
let "time=(( counter * interval ))"

if [ "$a" = "Safari" ]; then 
    page=`osascript -e 'tell application "Safari"' -e 'set theURL to URL of current tab of window 1' -e 'end tell'`
fi
if [ "$a" = "Firefox" ]; then 
    page=`osascript -e 'tell application "Firefox"' -e 'set theURL to URL of current tab of window 1' -e 'end tell'`
fi
if [ "$a" = "Google Chrome" ]; then 
    page=`osascript -e 'tell application "Google Chrome"' -e 'set theURL to URL of current tab of window 1' -e 'end tell'`
fi

letgo=0

if [[ "$page" == *"mail.google.com"* ]]; then #work-related pages exceptions
    letgo=1
fi
#echo $time $firstwarning

if [ $time -ge $firstwarning -a $(( ( time - firstwarning ) % remindinterval )) == 0 -o $time -gt $finaltime  ]; then 

    let "selection=( $selection + 1)"

    if [ $selection -gt $maxphrases ]; then 
	selection=maxphrases
    fi

    let "phrasenumber=( $RANDOM % $selection  + 1)"
    phrase=${responses[$phrasenumber]}

#    echo letgo $letgo $time $finaltime about to speak

    if [ $letgo -ne 1 -o $time -gt $finaltime ]; then 
#skip initial warnings to allow longer email checking; 
#still bug user if they are sitting too long at the email 
	say $phrase
    fi
fi    

else
counter=0
selection=3
fi

done
