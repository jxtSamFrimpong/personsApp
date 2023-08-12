#!/bin/bash

# sleep 10

UPDATE_NON_EXIST_PERSON=$(curl --write-out "%{http_code}\n" --silent --location --request PUT "http://$INTERNAL_IP:$API_PORT/person/12" \
--header 'Content-Type: application/json' \
--data-raw '{
    "id": "33",
    "name": "samuel",
    "age": "16"
}' | tail -1)

RESPONSE_CODE=$UPDATE_NON_EXIST_PERSON

if [ $RESPONSE_CODE -eq 404 ]
then
    echo "Test 5 Success"
    exit 0
else
    echo "Failure"
    exit 1
fi