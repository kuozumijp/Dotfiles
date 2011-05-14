#
# kuozumijp .zshrc $Id$
#

# color
local WHITE=$'%{\e[m%}'
local GREEN=$'%{\e[38;5;2m%}'
local PINK=$'%{\e[38;5;5m%}'
local RED=$'%{\e[38;5;1m%}'

# Prompt
PROMPT=$GREEN"[%n@${HOST%%.*}]"$WHITE"%(!.#.$) " # left
RPROMPT=$PINK"(%~)"$WHITE # right
PROMPT2=$WHITE"%_> "$WHITE # multiline
SPROMPT=$RED"zsh: correct '%R' to '%r' [n,y,a,e]? "$WHITE # errorline

SHELL=`which zsh`

setopt transient_rprompt # 右側まで入力がきたら時間を消す
setopt prompt_subst
bindkey -v  # -v:vi  -e:emacs

# Less Colors for Man Pages
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# 新規ディレクトリは755、新規ファイルは644にする
umask 022

# 日本語環境
export LANG=ja_JP.UTF-8

# エディタ
export EDITOR=vim

# nobeep
setopt no_beep
setopt nolistbeep

LISTMAX=0 # ウィンドウから溢れるときは尋ねる
autoload -U compinit # 強力な補完機能
compinit -u # このあたりを使わないとzsh使ってる意味なし
setopt autopushd # cdの履歴を表示
setopt pushd_ignore_dups # 同ディレクトリを履歴に追加しない
setopt auto_cd # 自動的にディレクトリ移動
setopt list_packed # リストを詰めて表示
setopt list_types # 補完一覧ファイル種別表示

# 履歴
HISTFILE=~/.zsh_history # historyファイル
HISTSIZE=10000 # ファイルサイズ
SAVEHIST=10000 # saveする量
setopt hist_ignore_dups # 重複を記録しない
setopt hist_ignore_all_dups # 重複を記録しない
setopt hist_reduce_blanks # スペース排除
setopt share_history # 履歴ファイルを共有
setopt EXTENDED_HISTORY # zshの開始終了を記録

# history 操作まわり
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^R" history-incremental-search-backward
bindkey "^N" history-beginning-search-forward-end
bindkey "^B" history-beginning-search-backward-end

# CVS
export CVS_RSH="ssh"
export CVSEDITOR="vim"

# SVN
export SVN_EDITOR="vim"
export SVN_SSH="ssh"

# alias
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

COMMAND=`which colordiff`
if [ "$?" -eq "0" ]; then
  alias diff="$COMMAND -u"
else
  COMMAND=`which colordiff.pl`
  if [ "$?" -eq "0" ]; then
    alias diff="$COMMAND -u"
  else
    alias diff="diff -U 0"
  fi
fi

if [ -x /usr/local/bin/multitail ]; then
  alias tail="multitail"
fi

alias bkup="tar cvf bkup_$(date +%Y%m%d%H%M%S).tar"
alias c="clear"
alias u="cd ../"
alias 755="chmod 755"
alias 600="chmod 600"
alias 604="chmod 604"
alias uname="uname -srm"
alias logout="exit"

# backupfileを作成 usage : org ファイル名
org () { cp $1 ${1}.org ; }

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pcolor関数
function pcolor() {
    for ((f = 0; f < 255; f++)); do
        printf "\e[38;5;%dm %3d#\e[m" $f $f
        if [[ $f%8 -eq 7 ]] then
            printf "\n"
        fi
    done
    echo
}

# screen
case "${TERM}" in
    screen)
        SCREEN_HOST=`hostname -s`
        preexec() {
            echo -ne "\ek${1%% *}($SCREEN_HOST)\e\\"
        }
        precmd() {
            echo -ne "\ek$(basename $(pwd))($SCREEN_HOST)\e\\"
        }
esac

[ -f ~/.zshrc.local ] && source ~/.zshrc.local # 設定ファイルのinclude