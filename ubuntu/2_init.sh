# update apt
sudo apt-get -qq update
sudo apt-get -qq dist-upgrade

# packages
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install build-essential zlib1g-dev libssl1.0 libssl1.0-dev curl file git

# linuxbrew
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# python@2
brew install python2
# link properly to /usr/bin
sudo ln -s "$(which python)" /usr/bin/python

# postgres 10
brew install postgresql
echo 'host all all 10.0.2.2/32 trust' >> /home/linuxbrew/.linuxbrew/var/postgres/pg_hba.conf

# redis
brew install redis

# rbenv
brew install rbenv
echo 'eval "$(rbenv init -)"' >> ~/.profile

# ruby 2.3 & bundler
export RUBY_VERSION=2.3.0
rbenv install -s $RUBY_VERSION
rbenv global $RUBY_VERSION

# node 8
brew install node@8
# latest node may not need this
echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/node@8/bin:$PATH"' >> ~/.profile

# yarn
brew install yarn

# aliases
echo 'alias pgstart="pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres start"' >> ~/.profile
echo 'alias pgstop="pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres stop"' >> ~/.profile
