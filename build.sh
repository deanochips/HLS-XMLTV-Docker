#!/bin/sh
export MY_IPS=$( hostname -I | cut -d ' ' -f 1 )$(echo ":3000")
exec docker-compose up -d $@
