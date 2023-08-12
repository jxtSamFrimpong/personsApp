#!/bin/sh


EXISTING_TAG_CHART=`cat persons/Chart.yaml | grep "version:" | head -1`
echo $EXISTING_TAG_CHART



sed -i "s/$EXISTING_TAG_CHART/$CHART_VERSION_REPLACE/g" persons/Chart.yaml
