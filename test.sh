#!/bin/bash


TODAY=$(date '+%Y%m%d')
BK_FILE_NAME="backup_$TODAY"
BK_PATH="/tmp"

function bk() {
    zip "$BK_PATH/$BK_FILE_NAME.zip" /tmp/$BK_FILE_NAME
    return 1
}

function up() {
    aws s3 cp "$BK_PATH/$BK_FILE_NAME.zip"  "s3://aokitest########"
    return 1
}

function my_error() {
    echo "Error happen. exit now"
    exit 1
}

echo "Start Backup"
bk
echo "Start Upload to s3"
up
echo "Done"      
