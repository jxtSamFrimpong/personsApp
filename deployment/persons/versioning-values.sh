#!/bin/sh

EXISTING_TAG_BACKEND=`cat values.yaml | grep "backendImageTag"`
EXISTING_TAG_WEBAPP=`cat values.yaml | grep "webappImageTag"`
echo $EXISTING_TAG_BACKEND
echo $EXISTING_TAG_WEBAPP



sed -i "s/$EXISTING_TAG_BACKEND/$NEW_BACKEND_VERSION/g" values.yaml
sed -i "s/$EXISTING_TAG_WEBAPP/$NEW_WEBAPP_VERSION/g" values.yaml
