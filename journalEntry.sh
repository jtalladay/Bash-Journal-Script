#!/bin/bash
#journalEntry.sh

# need string variable for customizing file name 
FILENAME=$(date +%Y-%m-%d)
FILENAME+="JournalEntry"

#Prompt strings. no idea why newline isnt working. so yeah...
DIRECTIONS1="The idea here is to write as much as you want. When you are done, " 
DIRECTIONS2="press enter and I'll save your entry for you. " 
DIRECTIONS3="I will also save your word count into a csv file and let you know how you are doing!"
PRINT_SPEED=0.06

# cool print slow function
print_slow(){
	STRING="$1"
	for ((i=0;i<${#STRING};i++)); do
    		char=${STRING:i:1}
    		printf "$char"
    		sleep $PRINT_SPEED
	done
	echo ""
}


clear
cd /home/jared/Documents/JournalEntries
pwd
echo "Current Date: " $FILENAME
echo "Hello $USER"
sleep 3
echo "Welcome to the best journaling program you'll ever use in this moment!"
sleep 3
echo "Journaling is good for you."
sleep 3
echo "Don't worry. I will help you."
sleep 3

# first, print directions
print_slow "$DIRECTIONS1" 
print_slow "$DIRECTIONS2" 
print_slow "$DIRECTIONS3" 

# Now create a new text file with the filename created earlier
TZ=UTC
date +%Y-%m-%d > $FILENAME.txt

# reads the journaling from the writer
read -e input

#saves input to new text file
echo "$input" >> $FILENAME.txt

# saves the word count to a variable
# USES BACKTICKS! LOOK THIS UP!
WORDS=`wc --word < $FILENAME.txt`
echo "Number of words: $WORDS"

DATE=$(date +%Y-%m-%d)
# Saves word count to csv file APPENDS
echo $WORDS" "$DATE >wordcount.csv

# This loop is intended to break up the text string into smaller lines of
# text. It technically works

#for ((i=0; i<=1000; i=i+50))
#do
#	echo "${input:i:50}""-" >> $FILENAME.txt
#
#done

