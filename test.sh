#!/bin/bash

# depends on  https://github.com/objz/mcl
# plus you will need to login using
# mcl account add --microsoft

./build.sh
MODPACK_VERSION=$(cat pack.json | jq -r '.adaptive_version')
mcl import --name adaptive-test adaptive-$MODPACK_VERSION.mrpack

mcl instance launch adaptive-test &
MC_PID=$!

# wait for game start
sleep 1

mcl log show --follow adaptive-test &
LOG_PID=$!

wait $MC_PID

kill $LOG_PID

mcl instance delete adaptive-test --yes