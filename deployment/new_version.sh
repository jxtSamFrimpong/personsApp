#!/bin/sh

PREPATCH=$(echo  $CHART_VERSION | awk -F "." '{print  $1"."$2 }')
let PATCH=$(echo  $CHART_VERSION | cut -d "." -f 3)
let PATCH=$PATCH+1
NEW_VERSION="$PREPATCH.$PATCH"
echo "$NEW_VERSION"
