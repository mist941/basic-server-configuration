# Install Vagrant

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install vagrant
``` 

# Install VirtualBox

```bash
sudo apt install virtualbox 
sudo apt install virtualbox-ext-pack
``` 

# Install libvirt 
```bash
sudo apt update
sudo apt install build-dep qemu-kvm libvirt-daemon-system libguestfs-tools ksmtuned libvirt-clients libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev ruby-libvirt ebtables
sudo usermod -aG libvirt $USER
vagrant plugin install vagrant-libvirt
```
