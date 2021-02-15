#!/bin/bash
# Ask user for name
# -- color
ORANGE='\033[0;33m'	# Orange
NC='\033[0m'		# No Color

printf "${ORANGE}Plex${NC} updater!\n"
echo Input plex update url:
read VARURL

regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
string='http://www.google.com/test/link.php'
if [[ $VARURL =~ $regex ]]
then 
    echo "Link valid"
else
    echo "Invalid url - exiting"
    exit 1
fi

echo "First, update and upgrade..."
sudo apt update && sudo apt upgrade
echo "Downloading file from url to ~/Downloads"
cd ~/Downloads
FILENAME=$(wget -nv --content-disposition "$VARURL" 2>&1 | cut -d\" -f2)
echo "$FILENAME"
read -p "Do you want to install $FILENAME? [Y/N]" -n 1 -r
echo 	# new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# Do
	echo "installing..."
	sudo dpkg -i "$FILENAME"
fi
printf "${ORANGE}Done.${NC}\n"
