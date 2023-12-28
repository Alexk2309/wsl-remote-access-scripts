#!/bin/dash

# Define the variables
REMOTE_HOST="<SERVER-IP"
REMOTE_USER="<REMOTE_USER>"

# This is the port that is used for your vnc server.
LOCAL_PORT=5901

# Your SSH tunneling command
# Check if the tunnel is already established
if ! pgrep -f "ssh -L $LOCAL_PORT:127.0.0.1:$LOCAL_PORT -N -f -l $REMOTE_USER $REMOTE_HOST" > /dev/null; then
    # If not, establish the tunnel
    ssh -L $LOCAL_PORT:127.0.0.1:$LOCAL_PORT -N -f -l $REMOTE_USER $REMOTE_HOST
    echo "SSH tunnel established"
else
    # If already running, print a message
    echo "SSH tunnel is already established"
fi
