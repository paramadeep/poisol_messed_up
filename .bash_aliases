alias port='sudo netstat -tulpn'
alias proc='ps aux|grep '

#stop a sercive from startup
#sudo update-rc.d openerp disable

#start service
#/etc/init.d/<> start

export PS1='${debian_chgeroot:+($debian_chroot)}\W\[\033[01;31m\]$ \[\033[01;37m\]'

alias rapp='rhc app'
alias rssh='rhc ssh'
alias rcar='rhc cartridge'
