# Testing Ansible Code

## Disclaimer

**Note:** This simplified testing environment isn't considered best practice for comprehensive Ansible testing. However, due to the project's emphasis on simplicity and beginner-friendliness, this approach is sufficient for initial validation.

---

## Objective

This project aims to provision new Ubuntu/Debian servers or desktops reliably. To ensure accuracy, a clean and reproducible local testing environment is necessary. Testing exclusively with Docker is insufficient since features like Docker installations or specific network configurations cannot be accurately validated within Docker containers.

---

## Testing Environment Options

### 1. Vagrant (Recommended)

Vagrant provides flexible testing with various virtualization providers, closely replicating actual server environments:

- **VirtualBox** *(Simplest setup, recommended)*
- VMware
- QEMU
- Libvirt

### 2. Docker (Limited)

Docker significantly differs from full Ubuntu/Debian installations but can still offer quick, initial validation for simpler tasks.

---

## Setup: Vagrant Testing Environment

### Prerequisites

- Install [Vagrant](https://www.vagrantup.com/docs/installation)
- Confirm [Virtualization capabilities](https://docs.vagrantup.com/providers/)
- Install your chosen virtualization provider:
  - [VirtualBox](https://www.virtualbox.org/wiki/Downloads) *(recommended)*
  - [Other Providers](https://www.vagrantup.com/docs/providers)

---

## Important Configuration Details

### Managing Environment Variables in Vagrant

Directly using environment variables (`.env`) in a `Vagrantfile` isn't straightforward. To simplify this, use the provided convenience script (`start-test.sh`) which easily manages these variables.

### IP Address Configuration

Vagrant needs either a static or DHCP-assigned IP:

- **Static IP** *(recommended for consistency)*:
  Ensure the IP is available and reachable from your host machine. Configure your `.env` file:
  ```bash
  VAGRANT_IP=<desired_static_ip>
  ```

- **DHCP IP** *(dynamic assignment)*:
  To retrieve dynamically assigned IP:

  **Linux:**
  ```bash
  vagrant ssh -c "hostname -I | cut -d' ' -f2" 2>/dev/null
  ```

  **macOS:**
  ```bash
  todo
  ```

### Network Configuration

- Vagrant typically uses a **private network**, providing a secure, isolated environment ideal for testing.

### SSH Configuration

- By default, Vagrant generates SSH keys. However, for beginner simplicity, this setup employs username/password authentication for initial connections.
- Advanced users can transition to SSH key-based authentication after initial validation.

---

## Running Vagrant Commands

`vagrant up` searches upward through directories to find a `Vagrantfile`. To prevent confusion:

1. Temporarily set `VAGRANT_CWD` environment variable:

```bash
export VAGRANT_CWD=<fullpath>/test/vagrant
```

2. Or simply run the provided script (`start-test.sh`) to automate environment setup and VM provisioning:

```bash
./start-test.sh
```

---

## Validating Ansible Code

After provisioning the Vagrant VM, validate your Ansible scripts:

- Run your Ansible playbooks against the Vagrant VM:

```bash
ansible-playbook -i <inventory_file> <playbook_name>.yml
```

- Ensure idempotency by re-running playbooks and checking for changes:

```bash
ansible-playbook -i <inventory_file> <playbook_name>.yml --check
```

---

This streamlined guide ensures clear and efficient Ansible testing aligned with beginner-friendly project objectives.

