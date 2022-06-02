#!/bin/bash

echo "Script Start"

#Create folder for downloaded files
pwd=$PWD
dir="${pwd}/download"
echo "dir=${dir}"

#Create folder for backup files
bkpdir="${pwd}/backup"
echo "bkpdir=$bkpdir"

#Save files in Stamped folder
Current="$(date +'%d-%m-%Y-%T')"

#URL Download the files from Mention URL
url="https://raw.githubusercontent.com/Auxin-io/covid-19-data/master/public/data/jhu/biweekly_cases.csv"
file="biweekly_cases.csv".$Current

#URL2 Download the files from the m=Mention URL2
url2="https://raw.githubusercontent.com/Auxin-io/covid-19-data/master/public/data/jhu/biweekly_deaths_per_million.csv"
file2="biweekly_deaths_per_million.csv".$Current

#Create dir & bkpdir folder
mkdir -p "$dir"
mkdir -p "$bkpdir"

#Now download the files
wget -qc "$url" -O "${dir}/${file}"
wget -qc "$url1" -O "${dir}/${file2}"

#Show the path of new Folder
echo "New Folder is '${dir}'"

#list the recent downloaded file
echo "Recent downloaded files are below:"
ls -Art "${dir}"

#Count the number of files in dir
cd "${dir}"
count=$(ls | wc -l)
echo "Total number of files are $count"


#Move 3 days older files into bkpdir
echo "Checking 3 days old files in $dir "
find . -name "*.csv" -mtime +3 | mv * /mnt/d/tech_challenge/backup 

#Count the number of files in bkpdir
cd "${bkpdir}"
count=$(ls | wc -l)
echo "Number of files in bkpdir are $count"

#Remove number of files older than 3 days
echo "Removing number of files that is older than 3 days are '$count' "
rm -rf *.*

echo "Script End"














