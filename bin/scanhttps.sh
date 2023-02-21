#!/bin/sh
ROOT=~/documents/Security/HTTPS

if [ $# -eq 0 ]; then
    echo "Usage: $0 web|ib"
    return 1
fi

DIR=$ROOT/results-$(date --iso-8601)-$1
mkdir --parents $DIR
for URL in $(cat $ROOT/banks-$1.txt); do
    testssl.sh --jsonfile-pretty $DIR/ -6 $URL;
done;
