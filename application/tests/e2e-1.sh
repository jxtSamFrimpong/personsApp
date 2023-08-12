#!/bin/bash

# sleep 10

ALL_PERSONS=$(curl --write-out "%{http_code}\n" --silent --location --request GET "http://$INTERNAL_IP:$API_PORT/persons" \
--form 'name="small"' \
--form '_id="5"' \
--form 'age="12"')

RESPONSE_CODE=$(echo $ALL_PERSONS | head -1 | awk -F " " '{print $5}')

# RESPONSE_CODE=`curl -i $INTERNAL_IP: | head -1 |awk '{print $2}'`

if [ $RESPONSE_CODE -eq 200 ]
then
    echo "Test 1 Success"
    exit 0
else
    echo "Failure"
    exit 1
fi