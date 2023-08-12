#!/bin/sh

EXISTING_TAG_CHART=`cat Chart.yaml | grep "appVersion"`
echo $EXISTING_TAG_CHART



sed -i "s/$EXISTING_TAG_CHART/$NEW_CHART_APP_VERSION/g" Chart.yaml
