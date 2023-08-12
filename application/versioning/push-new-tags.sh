#!/bin/sh

git config --global user.email "sfrimpong@112@gmail.com"
git config --global user.name "jenkins"

git remote rm origin &> /dev/null
git remote add origin http://$JENKINS_USER:$JENKINS_PASS@10.0.31.19/developer/persons.git &> /dev/null

git tag -a "$NEW_APPLICATIONS_TAG" -m "version $NEW_APPLICATIONS_TAG release"
git push origin "$NEW_APPLICATIONS_TAG"

#git tag -d v0.0.1
#git push --delete origin v0.0.1
#git push --delete origin --tags
#git tag --sort=taggerdate
#git tag --sort=-taggerdate