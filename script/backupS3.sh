#!/bin/bash
DATE=$(date +%y%m%d%H%M)
DB_HOST=$1
PASS=$2
DB_NAME=$3
SECRET=$4
BUCKET_NAME=$5

mysqldump -u root -h $DB_HOST -p$PASS $DB_NAME > /tmp/backup-$DATE“”.sql &&\
export AWS_ACCESS_KEY_ID="AKIA2ILK4TPSYJEJY7HC" &&\
export AWS_SECRET_ACCESS_KEY=$SECRET &&\
aws s3  cp /tmp/backup-$DATE“”.sql s3://$BUCKET_NAME