#!/bin/bash

# sleep 10

HIT_NGINX=$(curl -I $INTERNAL_IP:88 | head -1 | cut -d " " -f 2)

RESPONSE_CODE=$HIT_NGINX

if [ $RESPONSE_CODE -eq 200 ]
then
    echo "Test 8 Success"
    exit 0
else
    echo "Failure"
    exit 1
fi