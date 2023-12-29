# SSH and VNC Automation Documentation

## Prerequisites

Before using the provided scripts, ensure the following prerequisites are met:

1. **Windows Subsystem for Linux (WSL):** Install WSL on your Windows system.
2. **SSH Keys:** Set up SSH key authentication for secure connections.
3. **VNC Server:** Install a VNC server on your Linux server (e.g., TigerVNC).

## SSH Script

### 1. `ssh.bat`

This Batch script facilitates the execution of an SSH connection from Windows to a Linux server through WSL.

    @echo off
    wsl.exe bash -c "/PATH/TO/SSH/SHELL/SCRIPT/ON/WSL"

Replace "/PATH/TO/SSH/SHELL/SCRIPT/ON/WSL" with the actual path to your SSH script on WSL.

### 2. `ssh.sh`

This shell script is stored inside WSL, to ssh into a terminal

    #!/usr/bin/env bash
    ssh <USERNAME>@<IPADDRESS>

## VNC Script

### 1. `vnc.bat`

This Batch script initiates a VNC connection from Windows to a Linux server using WSL.

    @echo on
    wsl.exe bash -c "/PATH/TO/VNC/SHELL/SCRIPT/ON/WSL"
    start "" "\PATH\TO\VNC\EXECUTABLE" PATH\TO\VNC\CONFIG\FILE

### 2. `vnc.sh`

This shell script is stored inside WSL, to allow a localhost connection.

    #!/bin/dash

    # Define the variables
    REMOTE_HOST="<SERVER-IP>"
    REMOTE_USER="<REMOTE_USER>"
    LOCAL_PORT=5901

    # Check if the tunnel is already established
    if ! pgrep -f "ssh -L $LOCAL_PORT:127.0.0.1:$LOCAL_PORT -N -f -l $REMOTE_USER $REMOTE_HOST" > /dev/null; then
        # If not, establish the tunnel
        ssh -L $LOCAL_PORT:127.0.0.1:$LOCAL_PORT -N -f -l $REMOTE_USER $REMOTE_HOST
        echo "SSH tunnel established"
    else
        # If already running, print a message
        echo "SSH tunnel is already established"
    fi

Replace "SERVER-IP" and "REMOTE_USER" with your server's IP address and your remote username.

## vnc-config

This configuration file is used by the VNC viewer on the client side. Adjust the parameters based on your preferences and server settings. Modify these settings based on your VNC server configuration.

## Usage

1. **Save the provided scripts with the appropriate extensions (.bat or .sh).**
2. **Customize the scripts with your server details, paths, and configurations.**
3. **Run the Batch scripts on Windows to initiate SSH or VNC connections.**

**Note:** Ensure that the scripts have executable permissions if using them on a Linux system.

By following these instructions, you can automate the process of connecting to your Linux server from a Windows environment using SSH and VNC.
