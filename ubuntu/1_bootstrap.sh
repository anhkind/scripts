# add virtualbox guest additions
sudo mount /dev/cdrom /mnt
sudo apt-get install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r)
sudo su
/mnt/VBoxLinuxAdditions.run
exit

# add permission from vboxsf
sudo adduser $USER vboxsf
