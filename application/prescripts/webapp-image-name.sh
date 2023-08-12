#!/bin/sh

cat .env | grep "WEB_APP_IMAGE" | cut -d "=" -f 2