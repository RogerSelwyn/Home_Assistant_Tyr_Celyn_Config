#!/usr/bin/env bash

# Set Variables
echo Set Variables
DROPBOX_UPLOADER=/config/shell_scripts/dropbox_uploader.sh
BKP_CONFIG=/config/shell_scripts/.dropbox_uploader
BKP_DIR=/backup
BKP_FOLDER=/tyrcelyn

# Copy Home Assistant Snapshots to DropBox
echo Sync Dropbox
$DROPBOX_UPLOADER -sf $BKP_CONFIG upload "$BKP_DIR" $BKP_FOLDER

# Clean up older snapshots - removes older than 5 days
echo Clean up old snapshots
find "$BKP_DIR"/* -mtime +4 -exec rm {} \;

# Reload Snapshots in Home Assistant
# echo Reload snapshots
# ha sn reload

# mkdir /mnt/data
# mount /dev/mmcblk0p2 /mnt/data
# umount /mnt/data
# rmdir /mnt/data
