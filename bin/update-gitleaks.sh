#!/bin/bash

DIR=~/.local/share/gitleaks/

if ! hash gh 2>/dev/null; then
    echo "gh is required but it's not installed, see https://cli.github.com/"
    exit 2
fi

if hash gitleaks 2>/dev/null; then
    echo "You have $(gitleaks --version)"
fi

REPO=gitleaks/gitleaks
SCRIPT_DIR=$(dirname "$(realpath "$0")")
LATEST="$("$SCRIPT_DIR"/github-latest-tag.sh "$REPO")"
ARCHIVE="gitleaks_${LATEST}_linux_x64.tar.gz"

if [[ $DIR != ~/.local/share/* ]]; then
    echo "Oops, $DIR is not a safe dir to extract GitLeaks to"
    exit 1
fi

cd $DIR || exit 3

echo "Purging $DIR"
rm -rf "${DIR:?}/*"

echo "Downloading $REPO $LATEST to $DIR"
gh release download --repo "$REPO" "v$LATEST" --pattern "$ARCHIVE"

echo "Extracting $ARCHIVE"
tar xvf "$ARCHIVE" > /dev/null

echo "Deleting $ARCHIVE"
rm "$ARCHIVE"

echo "Done"
cd - || exit 4
