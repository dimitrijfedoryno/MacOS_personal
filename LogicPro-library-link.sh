#!/bin/bash

# LogicPro_GarageBand-library-link.sh
# Created by: Dimitrij Fedoryno
# Date: 2024-06-27

# Define paths for Logic and GarageBand locally
LOGIC_DIR="/Library/Application Support/Logic"
GARAGEBAND_DIR="/Library/Application Support/GarageBand"

# Define paths for Logic and GarageBand on external drive (DATA)
REMOTE_LOGIC_DIR="/Volumes/DATA/Library/Application Support/Logic"
REMOTE_GARAGEBAND_DIR="/Volumes/DATA/Library/Application Support/GarageBand"

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
fi

# Link Logic folder from external drive "DATA" to internal drive Library folder
sudo ln -s "$REMOTE_LOGIC_DIR" "$LOGIC_DIR"

# Link GarageBand folder from external drive "DATA" to internal drive Library folder
sudo ln -s "$REMOTE_GARAGEBAND_DIR" "$GARAGEBAND_DIR"
