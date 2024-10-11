#!/bin/bash

# AWS S3 bucket details
BUCKET_NAME="my-backup-bucket"
BACKUP_SOURCE="/path/to/backup"
DATE=$(date +%Y-%m-%d)
BACKUP_NAME="backup-$DATE.tar.gz"

# Create a tarball of the source directory
tar -czf /tmp/$BACKUP_NAME $BACKUP_SOURCE

# Upload the tarball to S3
aws s3 cp /tmp/$BACKUP_NAME s3://$BUCKET_NAME/

# Cleanup
rm /tmp/$BACKUP_NAME

# Log completion
echo "Backup completed for $BACKUP_SOURCE on $DATE"
