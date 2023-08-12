#!/bin/bash

# sleep 10

ADD_PERSON=$(curl --write-out "%{http_code}\n" --silent --location --request POST "http://$INTERNAL_IP:$API_PORT/person" \
--header 'Content-Type: application/json' \
--data-raw '{
    "id": "33",
    "name": "samuel",
    "age": "16"
}' | tail -1)

RESPONSE_CODE=$ADD_PERSON

if [ $RESPONSE_CODE -eq 201 ]
then
    echo "Test 3 Success"
    exit 0
else
    echo "Failure"
    exit 1
fi