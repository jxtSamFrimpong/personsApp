#!/bin/bash

# sleep 10

DELETE_EXIST_PERSON=$(curl --write-out "%{http_code}\n" --silent --location --request DELETE "http://$INTERNAL_IP:$API_PORT/person/33" \
--data-raw '' | tail -1)

RESPONSE_CODE=$DELETE_EXIST_PERSON

if [ $RESPONSE_CODE -eq 200 ]
then
    echo "Test 7 Success"
    exit 0
else
    echo "Failure"
    exit 1
fi