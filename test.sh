#!/bin/bash

# depends on  https://github.com/objz/mcl
# plus you will need to log in using
# mcl account add --microsoft

python build.py
mcl import --name adaptive-test adaptive-dev-build.mrpack

# Launch instance and capture its PID
mcl instance launch adaptive-test &
MC_PID=$!

# Wait for game to start
sleep 1

# Start log watcher in background and capture its PID
mcl log show --follow adaptive-test &
LOG_PID=$!

# Wait for Minecraft process to exit
wait $MC_PID

# Kill the log watcher process
kill $LOG_PID

# Delete instance
mcl instance delete adaptive-test --yes