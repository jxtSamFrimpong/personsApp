#!/bin/bash

# sleep 10

UPDATE_EXIST_PERSON=$(curl --write-out "%{http_code}\n" --silent --location --request PUT "http://$INTERNAL_IP:$API_PORT/person/33" \
--header 'Content-Type: application/json' \
--data-raw '{
    "id": "33",
    "name": "muller",
    "age": "6"
}' | tail -1)

RESPONSE_CODE=$UPDATE_EXIST_PERSON

if [ $RESPONSE_CODE -eq 200 ]
then
    echo "Test 6 Success"
    exit 0
else
    echo "Failure"
    exit 1
fi