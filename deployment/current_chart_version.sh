#!/bin/sh

git remote rm origin &> /dev/null
git remote add origin http://$JENKINS_USER:$JENKINS_PASS@10.0.31.19/developer/person-deployment.git &> /dev/null
git fetch --tags &> /dev/null
LAST_TAG=$(git tag --list | tail -1)


if [ ! -z "$LAST_TAG" ]
then
    echo "$LAST_TAG"
else
    echo "0.1.0"
fi