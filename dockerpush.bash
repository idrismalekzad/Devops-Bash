#!/bin/bash

echo "##########################################################################"
echo "#########################`date +%Y/%m/%d-%H:%M`"
echo "##########################################################################"

COUNTER=`docker ps --format "{{.Names}}" | awk '(NR>1)' | wc -l`

for((i=1;i<=$END;i++))
do
        CONTAINER=`docker ps --format "{{.Names}}" | awk '(NR>=1)' | head -n $i | tail -1`
        IMAGENAME="soheilpmr/devop06:$CONTAINER-`date +%Y%m%d%H`"

        docker commit $CONTAINER $IMAGENAME

        docker save $IMAGENAME > ~/backup-$CONTAINER-`date +%Y%m%d%H`

        docker push $IMAGE

done

find ~ -name "backup-*.tar" -mtime +7 -exec rm -rf {} \;

echo "###########################################################################"
~
~
~
~
~
