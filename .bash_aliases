alias port='sudo netstat -tulpn'
alias proc='ps aux|grep '
alias fn='find -name'

#stop a sercive from startup
#sudo update-rc.d openerp disable

#start service
#/etc/init.d/<> start

export PS1='${debian_chgeroot:+($debian_chroot)}\W\[\033[01;31m\]$ \[\033[01;37m\]'

#openshift RedHat
alias rapp='rhc app'
alias rssh='rhc ssh'
alias rcar='rhc cartridge'
alias rtail='rhc tail'

#git
alias gad='git add'
alias gst='git status'
alias gcm='git commit -m'
alias gca='git commit --amend -m'
alias gpl='git pull'
alias gplr='git pull --reb'
alias gph='git push'
alias gsh='git stash -f'
alias gsp='git stash pop'
alias glog='git log --grep='


#for pam
alias sshreg='echo VH9zadU6 ; ssh -o GSSAPIAuthentication=no root@172.16.20.237'
alias pamin='echo yes | cagvpn --login --username deepak --password July2011'
alias pamout='cagvpn --logout'
export RAILS_ENV=stub

#vim
export EDITOR=/usr/bin/vim
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#ftp
alias ftps='python -m SimpleHTTPServer 8000'
