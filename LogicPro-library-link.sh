#!/bin/bash

# LogicPro_GarageBand-library-link.sh
# Created by: Dimitrij Fedoryno
# Date: 2024-06-27
Volume_Name="DATA"
echo "--- Using volume name: $Volume_Name"

# Define paths for Logic and GarageBand locally
LOGIC_DIR="/Library/Application Support/Logic"
GARAGEBAND_DIR="/Library/Application Support/GarageBand"

# Define paths for Logic and GarageBand on external drive ($Volume_Name)
REMOTE_LOGIC_DIR="/Volumes/$Volume_Name/Library/Application Support/Logic"
REMOTE_GARAGEBAND_DIR="/Volumes/$Volume_Name/Library/Application Support/GarageBand"

#Define paths for Apple Loops on external drive ($Volume_Name)
REMOTE_APPLE_LOOPS_DIR="/Volumes/$Volume_Name/Library/Audio/Apple\ Loops"
APPLE_LOOPS_DIR="/Library/Audio/Apple\ Loops"

# Logic and GarageBand
##########################
echo "####################################################"
echo "$ - Symlinks for Logic and GarageBand"

if [[ -d "$LOGIC_DIR" && -d "$GARAGEBAND_DIR" ]]; then
    # Directories exist.
    echo "Logic and GarageBand folders already exist"
    if [[ -L "$LOGIC_DIR" && -L "$GARAGEBAND_DIR" ]]; then
        # They are symlinks!
        echo "Logic and GarageBand folders are already symlinks"
        rm "$LOGIC_DIR" && rm "$GARAGEBAND_DIR"
    else
        # They are not symlinks.
        echo "Logic and GarageBand folders are not symlinks"
        rm -rf "$LOGIC_DIR" && rm -rf "$GARAGEBAND_DIR"
    fi
else
    echo "One or both of the directories do not exist. Creating symlinks."
    
    # Link Logic folder from external drive "$Volume_Name" to internal drive Library folder
    sudo ln -s "$REMOTE_LOGIC_DIR" "$LOGIC_DIR"

    # Link GarageBand folder from external drive "$Volume_Name" to internal drive Library folder
    sudo ln -s "$REMOTE_GARAGEBAND_DIR" "$GARAGEBAND_DIR"
fi

# Apple Loops
##########################
echo "####################################################"
echo "$ - Symlinks for Apple Loops"
if [ -d "$APPLE_LOOPS_DIR" ]; then
    # Directories exist.
    echo "Logic and GarageBand folders already exist"
    if [ -L "$LOGIC_DIR" ]; then
        # They are symlinks!
        echo "Logic and GarageBand folders are already symlinks"
        rm "$APPLE_LOOPS_DIR"
    else
        # They are not symlinks.
        echo "Logic and GarageBand folders are not symlinks"
        rm -rf "$APPLE_LOOPS_DIR" 
    fi
else
    echo "Apple Loops folder does not exist. Directory do not exist. Creating symlinks."
    
    # Apple Loops folder from external drive "$Volume_Name" to internal drive Library/Audio folder
    sudo ln -s "$REMOTE_APPLE_LOOPS_DIR" "$APPLE_LOOPS_DIR"

fi