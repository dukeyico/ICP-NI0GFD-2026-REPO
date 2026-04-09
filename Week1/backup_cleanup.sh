#!/bin/bash

# ==========================================
# Automated Backup and Cleanup Script
# ==========================================

# Variables
SOURCE_DIR="$HOME/app_data"           # Directory to backup (create this if testing locally)
BACKUP_DIR="$HOME/backups"            # Where to store backups
LOG_FILE="$HOME/backups/backup.log"   # Log file location
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_NAME="backup_$DATE.tar.gz"
RETENTION_DAYS=7

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Function for logging
log_message() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Error Handling setup
set -e
trap 'log_message "ERROR: Script failed at line $LINENO." ; exit 1' ERR

log_message "Starting backup process..."

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    log_message "Source directory $SOURCE_DIR does not exist. Please create it. Exiting."
    exit 1
fi

# 1. Backup and Compress
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .
log_message "Backup successful: $BACKUP_NAME created."

# 2. Cleanup Old Backups
log_message "Cleaning up backups older than $RETENTION_DAYS days..."
find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +$RETENTION_DAYS -exec rm {} \;
log_message "Cleanup complete."

log_message "Backup and cleanup task finished successfully."