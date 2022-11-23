#!/bin/bash
# run in MASTER_DIR
set -x
set -e

MESSAGE=$1

git clone -b gh-pages https://github.com/huweihuang/python-notes.git gh-pages
MASTER_DIR="$(pwd)"
GHPAGE_DIR="${MASTER_DIR}/gh-pages"

# build
gitbook build

# clean GHPAGE_DIR
rm -fr ${GHPAGE_DIR}/*

# copy _book to GHPAGE_DIR
cp -fr ${MASTER_DIR}/_book/* ${GHPAGE_DIR}
cp -fr ${MASTER_DIR}/README.md ${GHPAGE_DIR}

# git commit
cd ${GHPAGE_DIR}
git add --all
git commit -m "${MESSAGE}"
git push origin gh-pages
