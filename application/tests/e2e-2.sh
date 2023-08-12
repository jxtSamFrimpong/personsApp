#!/bin/bash

# sleep 10

DELETE_NON_EXIST_PERSON=$(curl --write-out "%{http_code}\n" --silent --location --request DELETE "http://$INTERNAL_IP:$API_PORT/person/33" \
--form 'name="small"' \
--form '_id="5"' \
--form 'age="12"' | tail -1)

RESPONSE_CODE=$DELETE_NON_EXIST_PERSON

if [ $RESPONSE_CODE -eq 404 ]
then
    echo "Test 2 Success"
    exit 0
else
    echo "Failure"
    exit 1
fi