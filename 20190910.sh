#!/bin/bash

BK_DATE=`date +'%Y%m%d'`
BK_NAME=/root/git/menta
DL_DATE=`/bin/date -d '7 day ago' +%Y%m%d`

mysqldump --single-transaction -u root -pAokipiza0027# menta > $BK_NAME/menta_$BK_DATE.dump > /dev/null 2>&1

aws s3 cp $BK_NAME/menta_$BK_DATE.dump s3://menta-backup/

aws s3 rm s3://menta-backup/menta_$DL_DATE.dump
