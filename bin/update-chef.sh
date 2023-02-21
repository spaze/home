#!/bin/bash

REPO=gchq/CyberChef
DIR=/srv/www/cyberchef/
LATEST=$(curl -s https://api.github.com/repos/$REPO/releases/latest | jq .tag_name --raw-output)
ZIP="CyberChef_$LATEST.zip"
HTML_LATEST="CyberChef_$LATEST.html"
DIR_INDEX="CyberChef.html"

if [[ $DIR != /srv/www/* ]]; then
    echo "Oops, $DIR is not a safe dir to deploy CyberChef to"
    exit 1;
fi

cd $DIR

echo "Purging $DIR"
rm -rf $DIR

echo "Downloading $REPO $LATEST to $DIR"
gh release download --repo $REPO $LATEST

echo "Extracting $ZIP"
unzip $ZIP > /dev/null

echo "Deleting $ZIP"
rm $ZIP

echo "Renaming $HTML_LATEST to $DIR_INDEX"
mv $HTML_LATEST $DIR_INDEX

echo "Done"
cd -
