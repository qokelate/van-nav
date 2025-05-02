#!/bin/sh

cd /app 
ls -la

date1=`date '+%Y-%m-%d %H:%M:%S'`
git version && date1="$date1 -- $(git rev-parse --short HEAD)"

go mod tidy
go build -a -trimpath -ldflags="-buildid= -w -s -X 'main.build=$date1'" .

exit
