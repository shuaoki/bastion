DELETE_DATE=`/bin/date -d '8 day ago' +%Y%m%d`

aws s3 rm s3://aokitest20190905/backup_$DELETE_DATE.zip
