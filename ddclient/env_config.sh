#!/bin/bash
apk add --no-cache envsubst
sleep 2
envsubst < /tmp/ddclient.conf > /config/ddclient.conf
