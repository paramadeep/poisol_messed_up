sudo apt-get update

sudo apt-get install vim
sudo apt-get install exuberant-ctags
sudo apt-get install imagemagick --fix-missing
sudo apt-get install terminator
sudo apt-get install ag
sudo apt-get install jdownloader-installer

#kill amazon
sudo apt-get remove -y unity-lens-shopping
sudo apt-get remove unity-scope-video-remote
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"
gsettings set com.canonical.Unity.Lenses remote-content-search none

ln -s ~/work/nagal/.vim ~/.vim
ln -s ~/work/nagal/.vimrc ~/.vimrc
ln -s ~/work/nagal/.ctags ~/.ctags
ln -s ~/work/nagal/.bash_aliases ~/.bash_aliases
ln -s .gitignore_global ~/.gitignore_global
mkdir ~/.config/terminator
ln -s ~/work/nagal/terminator_config ~/.config/terminator/config

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

mkdir -p ~/.local/share/applications/apps
ln -s ~/work/nagal/apps ~/.local/share/applications/apps

#hibernate
#sudo nano /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
#[Re-enable hibernate by default]
#Identity=unix-user:*
#Action=org.freedesktop.upower.hibernate
#ResultActive=yes

