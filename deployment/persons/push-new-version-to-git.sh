#!/bin/sh

git remote rm origin &> /dev/null
git remote add origin http://$JENKINS_USER:$JENKINS_PASS@10.0.31.19/developer/person-deployment.git &> /dev/null

git add .
git commit -am "updated version of apps - $NEW_VERSION"
git push origin HEAD:master