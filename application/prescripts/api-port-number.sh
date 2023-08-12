#!/bin/sh

cat .env | grep "API_PORT" | cut -d "=" -f 2