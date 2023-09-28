# GitLab Reinstallation and Backup Script

This Bash script is designed to facilitate the reinstallation of GitLab Community Edition (CE) to a specified version while preserving important data and configurations. It is a step-by-step guide to ensure a smooth GitLab reinstallation process.

## Prerequisites

Before running the script, ensure the following prerequisites are met:

- **Linux Environment:** The script is intended for use on a Linux-based operating system, particularly systems using `apt-get` for package management.

- **GitLab Version:** You should specify the desired version of GitLab CE that you want to install. The variable `gitlab_version` in the script should be set to the desired version.

- **Backup Location:** Set the `backup_location` variable to specify where you want to store your GitLab data backups. Ensure you have enough storage space in this location.

## Usage

Follow these steps to use the script:

1. **Clone the Repository:** Start by cloning the repository containing the script to your server.

   ```bash
   git clone https://github.com/your-username/your-repo.git
   ```

2. Navigate to the Directory: Change your working directory to the cloned repository.

  ```bash
  cd your-repo
  ```   

3. Edit the Script: Open the script file (`reinstall_gitlab.sh`) using a text editor and configure the variables at the top of the script:

  - `gitlab_version`: Set it to the GitLab CE version you want to install. You can find the desired version on the GitLab website or in the official GitLab CE repository.

  - `backup_location`: Specify the directory where GitLab data backups will be stored. Ensure that this directory exists and is writable.

  For example, open the script in a text editor using the `nano` editor:

  ```bash
  nano reinstall_gitlab.sh
  ```
4. Locate the variables section at the top of the script and modify them according to your preferences:

  ```bash
  # Specify the GitLab version to install
  gitlab_version="16.1.2-ce.0"

  # Backup location
  backup_location="/root/backups"
  ```
5. Save your changes and exit the text editor.

6. Make the Script Executable: Ensure the script has executable permissions to allow it to be run:

  ```bash
  chmod +x reinstall_gitlab.sh
  ```

7. Run the Script: Execute the script with superuser privileges (e.g., sudo) to perform the GitLab reinstallation:

  ```bash
  sudo ./reinstall_gitlab.sh
  ```

Follow the On-screen Instructions: The script will guide you through the reinstallation process, including stopping GitLab services, backing up data, uninstalling the existing GitLab CE, installing the specified version, reconfiguring GitLab, starting services, and restoring data and configuration files.

During the execution of the script, you may be prompted to confirm certain actions, such as stopping services or overwriting configuration files. Please review and confirm these actions as needed by following the on-screen prompts.

Completion: After the script finishes, you'll receive a message indicating that GitLab has been reinstalled to the specified version, and the data has been restored.

## Important Notes

  - Backup Data: Regularly back up your GitLab data to prevent data loss during the reinstallation process.

  - Use with Caution: Be cautious, especially when removing GitLab files and directories. Ensure you have recent backups.

  - Testing: It's advisable to test the script in a non-production environment before using it in a production environment.

  - GitLab CE Version: Ensure that the specified `gitlab_version` is a valid GitLab CE version available in the official GitLab repositories.

## License

  This script is provided under the MIT License. You are free to use, modify, and distribute it as needed.

## Support and Contributions

  If you encounter issues or have suggestions for improvements, please feel free to open an issue or submit a pull request on the GitHub repository.

### Happy GitLab reinstallation and data backup!


