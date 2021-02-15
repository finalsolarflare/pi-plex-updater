#pi-plex-updater

Interactive script to update plex on the pi.

After cloning - set execute permission
chmod 755 plex-update.sh

+ Copy the update url from the plex web app

+ Run script with -
./plex-update.sh

+ Paste the update url when prompted
+ Confirm you want to install the downloaded file


===

The script does the following

+ sudo apt update && sudo apt upgrade
+ cd ~/Downloads
+ wget $INPUTURL
+ dpkg -i $DOWNLOAD



