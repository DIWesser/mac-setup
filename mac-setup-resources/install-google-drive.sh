#!/bin/bash
# This is a chrome installation script for macOS.
# This script has not been fully tested.

# Make sure extra files end up where you will find them
cd ~/Desktop

# Download Chrome .dmg
curl -O https://dl.google.com/drive/InstallBackupAndSync.dmg

# Open/mount .dmg
hdiutil mount InstallBackupAndSync.dmg

# Move .app to /Applications
cp -r '/Volumes/Install Backup and Sync from Google/Backup and Sync.app' '/Applications'

# Unmount .dmg
hdiutil unmount /Volumes/Install\ Backup\ and\ Sync\ from\ Google

# Remove .dmg
rm InstallBackupAndSync.dmg
