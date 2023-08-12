#!/bin/sh

PREPATCH=$(echo  $CURRENT_APPLICATIONS_TAG | awk -F "." '{print  $1"."$2 }')
let PATCH=$(echo  $CURRENT_APPLICATIONS_TAG | cut -d "." -f 3)
let PATCH=$PATCH+1
NEW_VERSION="$PREPATCH.$PATCH"
echo "$NEW_VERSION"
