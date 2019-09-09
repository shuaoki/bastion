#!/bin/bash

aws s3 ls s3://aokitest20190905 > list.log
num=`cat list.log |awk 'END {print NR}'`
num=`expr $num - 7`
echo "delete num = $num"
echo "delete list"
cat list.log |head -n $num

for target in `seq 1 $num`
	do
  rmfile=`cat list.log |awk '{print $4}' | head -n $target`
	done
	
echo $rmfile
  
for delete in $rmfile
	do
  aws s3 rm s3://aokitest20190905/$delete
	done
