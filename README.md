# Basic Server Configuration

An Ansible playbook for automating secure server setup and configuration with sensible defaults for systems.

## 🚀 Features

- **System Updates**: Keeps your servers up-to-date with the latest security patches
- **User Management**: Creates a secure non-root user with sudo privileges
- **SSH Hardening**: Configures SSH for key-based authentication only
- **Firewall Setup**: Installs and configures UFW with secure defaults
- **Security Enhancements**:
  - Fail2ban for intrusion prevention
  - Automatic security updates
  - Sensible security defaults
- **Time Synchronization**: Configures NTP for accurate system time
- **Essential Packages**: Installs common utilities (vim, curl, htop, git, mtr)

## 📋 Prerequisites

- Ansible 2.9+
- SSH key pair
- Target Ubuntu servers
- Local environment variables

## 🔧 Setup & Configuration

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/basic-server-configuration.git
   cd basic-server-configuration
   ```

2. Configure environment variables in a `.env` file, you can follow the sample file provided in `.env.template` and fill in your data

3. Update the `inventory.ini` file with your server IP addresses:
   ```ini
   [servers]
   192.168.1.10
   192.168.1.11
   # Add your servers here
   ```

4. Run the playbook:
   ```
   ./run.sh
   ```

## 🛡️ What Gets Configured

- Creates a new sudo user with SSH key authentication
- Disables SSH password authentication and root login
- Configures firewall (UFW) to allow only SSH
- Sets up Fail2ban to prevent brute-force attacks
- Configures automatic security updates
- Installs essential system utilities
- Sets timezone to Europe/Kyiv (configurable)

## ⚙️ Customization

Edit `playbook.yml` to:
- Change the timezone
- Modify the package list
- Adjust security settings
- Add or remove configuration tasks

## 🤝 Contributions

Stars and contributions are highly appreciated! If you find this project useful, please consider:

- ⭐ Starring the repository
- 🔀 Creating a pull request with enhancements
- 🐛 Opening issues for bugs or feature requests
- 📢 Sharing with fellow sysadmins and DevOps engineers

Let's collaborate to build a more robust, secure, and feature-rich server configuration tool together!

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.
