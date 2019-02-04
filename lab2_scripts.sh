#!/bin/bash
# Authors : Zachary Guse
# Date: 1/3/2019

#Problem 1 Code:
#Make sure to document how you are solving each problem!

#Enter expression and file name and store both variables

echo "Enter a regular expression:"
read regexp

echo "Enter a file name you want to analyze:"
read file

grep "$regexp" $file

#PHONE - looks at the format of each line making sure it is xxx-xxx-xxxx in regex_practice.txt and counts the number of occurances that matches
grep '\(\(([0-9]\{3\})\|[0-9]\{3\}\)[-]\?\)\{3\}[0-9]\{3\}$' regex_practice.txt | wc -l


#EMAIL - looks at the format of each line in regex_pracatice.txt file and counts the number of occurances that matches    
grep '^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-z]{2,}' regex_practice.txt | wc -l


#PHONE - looks for the starting 3 digits (area code) to be 303, if it matches it will append it to phone_results.txt
grep '\(\(([0-9]\{3\})\|[0-9]\{3\}\)[-]\?\)\{2\}[0-9]\{4\}' regex_practice.txt | grep ^303 >> phone_results.txt


#EMAIL - looks for the term "geocities.com" on each line of the regex_practice file; if it matches it will be appended to the email_results.txt
grep -i "geocities.com" regex_practice.txt >> email_results.txt

# append all of the data collected in previous steps and put into command_results.txt
grep "$regexp" regex_practice.txt >> command_results.txt

# I ran into problems with filtering out some of the telephone numbers from the list, I could not figure out why several false-positives passed through the filter. I also ran into problems with the counting of both, the telephone and email lists. 
