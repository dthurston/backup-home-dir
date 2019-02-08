# backup-home-dir
This script backs up your home directory to either a USB key or an AWS S3 bucket.

## Requires an AWS S3 bucket
Set up your [AWS account](https://aws.amazon.com) and create an S3 Bucket

## Required utilities
Set up [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html)

## Default variables
These are set to the following.  Make changes as necessary for your env.

```bash
username=`whoami`
bucketname=
directory=`mount | grep 'run/media' | awk '{print$3}'`
```
* username is the user directory being backed up
* bucketname is the name of the S3 bucket
* directory is the directory of the mounted USB key

