#!/bin/bash
docker commit pedantic_antonelli ubuntu-1:v1-0

docker save ubuntu-1:v1-0 > ~/ubuntu-backup-`date +%y%m%d`.tar

docker tag ubuntu-1:v1-0 soheilpmr/devop06 ubuntu-backup-`date +%y%m%d%H`

docker push oheilpmr/devop06 ubuntu-backup-`date +%y%m%d%H`

find ~ -name "ubuntu-backup*.tar" -mtime +7 -exec rm -rf {} \;
