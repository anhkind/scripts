# update apt
sudo apt-get -qq update
sudo apt-get -qq dist-upgrade

# packages
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install build-essential curl file git

# linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# postgres 10
brew install postgresql

# redis
brew install redis

# rbenv
brew install rbenv
echo 'eval "$(rbenv init -)"' >> ~/.profile

# ruby 2.3 & bundler
export RUBY_VERSION=2.3.0
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install zlib1g-dev libssl1.0 libssl1.0-dev
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
gem install bundler

# node 8
brew install node@8
# latest node may not need this
echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/node@8/bin:$PATH"' >> ~/.profile

# yarn
brew install yarn

# ~/.ssh/authorized_keys
export PUBLIC_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDj1Aq38rSXKulw0nDNbEAqmTkr8WZ+GTy/MgaSRe43gikKIjg+GTfBiP1ekWQwOhqYXaUhuTughzGeDyDZ/f3EHaElWg3xSi2YB5KeIL7FLNpMe9pAql4MHwxZTUoj4mE70L65rk90YZR/kHge+x5laZwfheg20w01XsiGIZXXr3VuiGDFr9omHMIJBNKYouFrGiWwklfPRTTJp61CA08LPpV2ROoBON0GBpMYo38IPcCOwGQFo6wZWYPf/Tun3ABQj5qQLPWoG6EAfJodiDuvH1Xh+dQYBOUKF0j1vz/C7ar8Y0JmmrPgIQl+OlJkpX1FSHgvSwul0IGHd9fmYKzX"
touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys
echo "$PUBLIC_KEY" >> ~/.ssh/authorized_keys
