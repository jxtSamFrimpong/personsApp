#!/bin/sh

PACKAGE=`ls *.tgz | head -1`

# git remote rm origin &> /dev/null
# git remote add origin http://$JENKINS_USER:$JENKINS_PASS@10.0.31.19/developer/person-deployment.git &> /dev/null

git tag -a $NEW_CHART_VERSION -m "version $NEW_CHART_VERSION  release" &> /dev/null
git push origin "$NEW_CHART_VERSION" &> /dev/null

echo $PACKAGE

