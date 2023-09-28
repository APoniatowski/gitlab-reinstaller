#!/bin/bash

# Specify the GitLab version to install
gitlab_version="16.1.2-ce.0"

# Backup location
backup_location="/root/backups"

# Stop GitLab services
gitlab-ctl stop

# Backup GitLab Data Directory (excluding some directories)
rsync -a --delete /var/opt/gitlab/ "$backup_location/gitlab_data/"

# Backup GitLab Configuration Files
cp /etc/gitlab/gitlab.rb "$backup_location/gitlab.rb"
cp /etc/gitlab/gitlab-secrets.json "$backup_location/gitlab-secrets.json"

# Uninstall GitLab CE
apt-get remove gitlab-ce

# Remove any remaining GitLab files and directories (use with caution)
rm -rf /opt/gitlab

# Install the specified GitLab CE version
apt-get update
apt-get install -y gitlab-ce=$gitlab_version

# Reconfigure GitLab
gitlab-ctl reconfigure

# Start GitLab services
gitlab-ctl start

# Restore GitLab Data Directory
rsync -a "$backup_location/gitlab_data/" /var/opt/gitlab/

# Restore the backup of configuration files
cp "$backup_location/gitlab.rb" /etc/gitlab/gitlab.rb
cp "$backup_location/gitlab-secrets.json" /etc/gitlab/gitlab-secrets.json

# Reconfigure GitLab to apply restored configuration
gitlab-ctl reconfigure

echo "GitLab has been reinstalled to version $gitlab_version, and the data has been restored."
