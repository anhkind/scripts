# add virtualbox guest additions (from https://askubuntu.com/a/949286)
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install dkms build-essential linux-headers-generic linux-headers-$(uname -r) virtualbox-guest-additions-iso
sudo mount /usr/share/virtualbox/VBoxGuestAdditions.iso /mnt
sudo su -c '/mnt/VBoxLinuxAdditions.run'

# add permission from vboxsf
sudo adduser $USER vboxsf

# ~/.ssh/authorized_keys
export PUBLIC_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDj1Aq38rSXKulw0nDNbEAqmTkr8WZ+GTy/MgaSRe43gikKIjg+GTfBiP1ekWQwOhqYXaUhuTughzGeDyDZ/f3EHaElWg3xSi2YB5KeIL7FLNpMe9pAql4MHwxZTUoj4mE70L65rk90YZR/kHge+x5laZwfheg20w01XsiGIZXXr3VuiGDFr9omHMIJBNKYouFrGiWwklfPRTTJp61CA08LPpV2ROoBON0GBpMYo38IPcCOwGQFo6wZWYPf/Tun3ABQj5qQLPWoG6EAfJodiDuvH1Xh+dQYBOUKF0j1vz/C7ar8Y0JmmrPgIQl+OlJkpX1FSHgvSwul0IGHd9fmYKzX"
mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys && chmod 700 ~/.ssh/authorized_keys
echo "$PUBLIC_KEY" >> ~/.ssh/authorized_keys

# create new key (from: https://stackoverflow.com/a/3659691/1036829)
echo -e "\n\n\n" | ssh-keygen -q -t rsa -N '' >/dev/null
cat ~/.ssh/id_rsa.pub
