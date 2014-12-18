sudo apt-get update

sudo apt-get install vim
sudo apt-get install exuberant-ctags
sudo apt-get install imagemagick --fix-missing
sudo apt-get install terminator
sudo apt-get install silversearcher-ag
sudo apt-get install jdownloader-installer
sudo apt-get install curl
#sudo apt-get install redshift
sudo apt-get install sni-qt:i386
sudo apt-get install tree
sudo apt-get install vlc
#sudo apt-get install virtualbox
udo apt-get install unzip

#db
sudo apt-get install postgresql-client

#java
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

#ruby
sudo apt-get install bundler
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev
rbenv install 2.1.5

#kill amazon
sudo apt-get remove -y unity-lens-shopping
sudo apt-get remove unity-scope-video-remote
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"
gsettings set com.canonical.Unity.Lenses remote-content-search none

#remove thunderbird
sudo apt-get purge thunderbird*
sudo apt-get purge empathy*

ln -s ~/work/nagal/.vim ~/.vim
ln -s ~/work/nagal/.vimrc ~/.vimrc
ln -s ~/work/nagal/.ctags ~/.ctags
ln -s ~/work/nagal/.bash_aliases ~/.bash_aliases
ln -s .gitignore_global ~/.gitignore_global
mkdir ~/.config/terminator
ln -s ~/work/nagal/terminator_config ~/.config/terminator/config

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#ui settings change
gsettings set org.gnome.settings-daemon.peripherals.touchpad natural-scroll true
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 3

sudo firefox -CreateProfile personal
sudo firefox -CreateProfile mail
mkdir -p ~/.local/share/applications/
ln -s ~/work/nagal/apps ~/.local/share/applications/apps

#btsyncnc
mkdir -p ~/work/app/
curl -o ~/work/app/btsync.tar.gz http://download.getsyncapp.com/endpoint/btsync/os/linux-x64/track/stable
unzip ~/work/app/btsync.tar.gz  ~/work/app/btsync

#hibernate
#sudo nano /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
#[Re-enable hibernate by default]
#Identity=unix-user:*
#Action=org.freedesktop.upower.hibernate
#ResultActive=yes

#http://askubuntu.com/a/170982/92185 turn off desktop
#http://askubuntu.com/a/500640/92185 oracle sql developer
