#!/bin/bash
clear

username=`whoami`
bucketname=
directory=`mount | grep 'run/media' | awk '{print$3}'`

function backup-dry {
	rsync --dry-run -av --exclude=".*/" /home/$username $directory
}

function backup {
	rsync -av --exclude=".*/" /home/$username $directory
}


echo "Please choose your backup method:"
echo "1) Dry Run for local USB"
echo "2) for local USB"
echo "3) for aws s3"
read userinput

if  [ -z $userinput ]; then
  echo "No choice made... exiting!"
  exit 1
elif [ "$userinput" == "1" ]; then
	if [ ! -d "$directory" ]; then
    	  echo "Plug in your USB key."
	exit 1
        fi
  	echo "Performing Dry Run of backup to USB"
	cd
	backup-dry
    exit 0
elif [ "$userinput" == "2" ]; then
	if [ ! -d "$directory" ]; then
    	  echo "Plug in your USB key."
	exit 1
        fi
  	echo "Performing backup to USB"
	cd
	backup
    exit 0
elif [ "$userinput" == "3" ]; then
  if [[ $bucketname ]]; then
    echo "Performing backup to S3"
    aws s3 sync ~/Documents s3://$bucketname
    echo "Backup complete"
  else
    echo "AWS bucket not defined in script!"
  fi
  exit 1
else
  echo "Invalid choice made... exiting!"
  exit 1
fi
