#Heroku
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
heroku login

#rhc
gem install rhc
gem update rhc
rhc setup

#rvm
sudo apt-get install curl
curl -L https://get.rvm.io | bash -s stable
source /home/r/.rvm/scripts/rvm
sudo apt-get --no-install-recommends install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev libgdbm-dev ncurses-dev automake libtool bison subversion pkg-config libffi-dev
rvm install 1.9.3
rvm use 1.9.3 --default
rvm gemset create rails3132
rvm use 1.9.2@rails3123 --default
gem install rails --version 3.2.13 --no-ri --no-rdoc

#vim
sudo apt-get install vim
sudo apt-get install exuberant-ctags
sudo apt-get install ack-grep

#spree
sudo apt-get install nodejs
sudo apt-get install imagemagick --fix-missing

#misc
sudo apt-get install jdownloader-installer

#work
mkdir work
cd work
