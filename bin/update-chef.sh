#!/bin/bash

DIR=/srv/www/cyberchef/

if ! hash gh 2>/dev/null; then
    echo "gh is required but it's not installed, see https://cli.github.com/"
    exit 2
fi

REPO=gchq/CyberChef
SCRIPT_DIR=$(dirname "$(realpath "$0")")
LATEST="v$("$SCRIPT_DIR"/github-latest-tag.sh "$REPO")"
ZIP="CyberChef_$LATEST.zip"
HTML_LATEST="CyberChef_$LATEST.html"
DIR_INDEX="CyberChef.html"

if [[ $DIR != /srv/www/* ]]; then
    echo "Oops, $DIR is not a safe dir to deploy CyberChef to"
    exit 1
fi

cd $DIR || (echo "$DIR doesn't exist"; exit 3)

echo "Purging $DIR"
rm -rf "$DIR"

echo "Downloading $REPO $LATEST to $DIR"
gh release download --repo "$REPO" "$LATEST"

echo "Extracting $ZIP"
unzip "$ZIP" > /dev/null

echo "Deleting $ZIP"
rm "$ZIP"

echo "Renaming $HTML_LATEST to $DIR_INDEX"
mv "$HTML_LATEST" "$DIR_INDEX"

echo "Done"
cd - || (echo "Cannot cd -"; exit 4)
