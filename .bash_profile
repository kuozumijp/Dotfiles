#
# kuozumijp .bash_profile $Id$
#

# use zsh
ZSH=`grep \/zsh /etc/shells | grep -v '#' | tail -n 1`
if [ "${ZSH}" != "" -a -f ~/.zshrc ]; then
    exec $ZSH
fi

SHELL=`which bash`

WORKING_DIRECTORY='\[\e[$[COLUMNS-$(echo -n " (\w)" | wc -c)]C\e[1;35m(\w)\e[0m\e[$[COLUMNS]D\]'
export PS1='\033k\033\\'${WORKING_DIRECTORY}'${debian_chroot:+($debian_chroot)}\[\033]2;[\h:\w] \u \007\]\[\e[0;33m\[\e[1;32m\][\u@\h]\[\e[00m\]\$ '

export PATH=$PATH:$HOME/bin

#デフォルトのエディタ
export EDITOR="vim"

# コマンドの履歴は500
export HISTSIZE="10000"
export HISTCONTROL=ignoredups
export HISTIGNORE="c:u:[bf]g:cd:date:df:top:ps*:l[ahlst]*:history*:less*:exit:pwd:whois*:git pull:git st:git b:git diff:git pr"

# ページャはless
export PAGER="less"

# lessコマンド使用時に下部にファイル名と行数を表示
export LESS='-X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..].'

# パーミッション644でファイルを作成
umask 022

# CVS
export CVS_RSH="ssh"
export CVSEDITOR="vim"

# SVN
export SVN_EDITOR="vim"
export SVN_SSH="ssh"

export LS_COLORS="di=46:ln=46:ex=36:*.tar=31:*.gz=31:*.tgz=31:*.bz2=31:*.zip=31:*.sql=32:*.SQL=32':*.html=35:*.hdml=35"
export TERM="vt100"

# aliaes
alias ll="ls -laF"
alias la="ls -FCa"
alias ls="ls -F"
alias lt="ls -lt"
alias rm="rm -i"
alias rmd="rm -ir"
alias vi="TERM=xterm-color vim"
alias vim="TERM=xterm-color vim"
alias make="gmake"
alias svn="env LANG=C svn"

if [ -x /usr/local/bin/rlwrap ]
then
  alias sqlplus="rlwrap sqlplus /nolog"
else
  alias sqlplus="sqlplus /nolog"
fi

alias bkup="tar cvf bkup_$(date +%Y%m%d%H%M%S).tar"
alias c="clear"
alias u="cd ../"
alias 755="chmod 755"
alias 600="chmod 600"
alias 604="chmod 604"
alias uname="uname -srm"

# backupfileを作成 usage : org ファイル名
org () { cp $1 ${1}.org ; }

# local settings
if [ -f ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi
