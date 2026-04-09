# Week 1: Shell Scripting Automation

## Real-World Problem Addressed
System administrators and developers frequently need to back up application data and clear out outdated files to save disk space. Doing this manually is error-prone and time-consuming.

## Solution Overview
This Bash script (`backup_cleanup.sh`) automates the process of compressing a target directory, storing it in a backup location, and automatically pruning backups older than 7 days. All actions and errors are logged for audit purposes.

## Key Features
- **Automation:** Creates compressed `.tar.gz` archives.
- **Log Management:** Records timestamps and statuses in `backup.log`.
- **Error Handling:** Uses `set -e` and `trap` to catch and log failures.
- **Cleanup:** Automatically deletes backups older than 7 days.

## How to Run
1. Make the script executable:
   ```bash
   chmod +x backup_cleanup.sh