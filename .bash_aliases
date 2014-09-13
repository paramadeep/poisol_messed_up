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
alias gad='git add --all'
alias gst='git status'
alias gcm='git commit -m'
alias gcma='git commit -a -m'
alias gcaa='git commit -a --amend -m'
alias gca='git commit --amend -m'
alias gpl='git pull'
alias gplr='git pull --reb'
alias gph='git push'
alias gsh='git stash -f'
alias gsp='git stash pop'
alias gln='git log --name-status'
alias gl='git log '


#for pam
alias pamin='echo yes | cagvpn --login --username deepak --password July2011'
alias pamout='cagvpn --logout'
export RAILS_ENV=stub
alias prodb="echo 'psql -U admin -h 172.16.20.210 -d promotion_qa -p 5446';sshpass -p S6djbI2w  ssh root@172.16.20.242"
alias mpdb="echo 'psql -U admin -h 172.16.20.210 -d  merchandise_platform_qa -p 5435'; sshpass -p S6djbI2w  ssh root@172.16.20.242"
alias proapp="echo 'tail -1000fn /data/promotion_app/current/log/italy_qa.log';sshpass -p S6djbI2w  ssh root@172.16.20.242"
alias proser="echo 'tail -1000fn /data/services/logs/promotion-core.log';sshpass -p S6djbI2w  ssh root@172.16.20.242"
alias mpapp="echo 'tail -1000fn /data/promotion_app/current/log/italy_qa.log';sshpass -p S6djbI2w  ssh root@172.16.20.242"
alias mpser="echo 'tail -1000fn /data/promotion_app/current/log/italy_qa.log';sshpass -p D4O1jzu7  ssh root@172.16.20.241"

#vim
export EDITOR=/usr/bin/vim
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#ftp
alias ftps='python -m SimpleHTTPServer 8000'

export PATH=$PATH:/home/d/work/nagal/git-plus:/home/d/work/apps/node/bin:$JAVA_HOME/jre/bin/:$JAVA_HOME/bin/:/home/d/work/apps/gradle-2.0/bin:/home/d/work/apps/sdk_adt/tools:/home/d/work/apps/sdk_adt/platform-tools/:/home/d/work/apps/play-2.0:/home/d/work/apps/scala-2.11.2/bin/
