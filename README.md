# backup-home-dir
This script backs up your home directory to either a USB key or an AWS S3 bucket.

## Requires an AWS S3 bucket
Set up your [AWS account](https://aws.amazon.com) and create an S3 Bucket

## Required utilities
Set up [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html)

## Define the following variables in the script
example:
```bash
username=backupuser
usbname=KINGSTON
bucketname=my-s3-backup
directory="/run/media/`whoami`/"
```
* username is the user running the backup
* usbname is the name of the mounted USB key
* bucketname is the name of the S3 bucket
* directory is the path to your USB key when mounted

