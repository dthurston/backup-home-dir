#!/bin/bash
clear
#back up to local drive OR aws s3
echo "Please choose your backup method:"
echo "1) for local USB"
echo "2) for aws s3"
read userinput

if  [ -z $userinput ]; then
  echo "No choice made... exiting!"
  exit 1

elif [ "$userinput" == "1" ]; then
  echo "Performing backup to USB"
	if [ ! -d "/run/media/dthursto/Backup" ]; then
          echo "Backup directory not found.  Plug in your USB key."
          exit 1
        fi
	cd
	rsync -av --exclude 'Downloads' --exclude '.cache' --delete /home/dthursto /run/media/dthursto/Backup/
  exit 1

elif [ "$userinput" == "2" ]; then
  echo "Performing backup to S3"
  ARRAY=(`aws s3 ls | awk '{print$3}'`)
  count=0
  start=${ARRAY[0]}
    while [ "x${ARRAY[count]}" != "x" ]
    do
        echo $count ${ARRAY[count]}
        count=$(( $count + 1 ))
    done
  exit 1
else
  echo "Invalid choice made... exiting!"
    exit 1
fi


# Local drive backup
