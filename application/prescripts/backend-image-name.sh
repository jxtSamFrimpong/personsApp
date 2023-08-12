#!/bin/sh

cat .env | grep "BACKEND_IMAGE" | cut -d "=" -f 2