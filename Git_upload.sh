#!/bin/bash
GIT_MESSAGE=$1

echo "****** addiing changes to git ****** "
git add .

echo "****** commiting changes to git ****** "
git commint -m $GIT_MESSAGE

echo "****** pushing changes to git ****** "
git push origin master

