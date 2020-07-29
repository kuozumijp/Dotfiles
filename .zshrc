#
# kuozumijp .zshrc
#

export PATH=$PATH:$HOME/bin
export GOPATH=$HOME/.go

# color
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:ex=01;32:*.tar=01;31'
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
SSHDCONFIG=`find /etc/* -name sshd_config -maxdepth 2 2>/dev/null |sort -u |head -1`
if [ ${SSHDCONFIG} ]; then
  ACCESSPORT=`sudo grep Port ${SSHDCONFIG}|grep -v '#'|awk '{print $2}'`
  if [ -n "$ACCESSPORT" -a "$ACCESSPORT" != "22" ]; then
      PROMPT=$GREEN"[%n@${HOST%%.*}:"$RED"${ACCESSPORT}"$GREEN"]"$WHITE"%(!.#.$) " # left
  fi
fi

# gitのステータスを表示
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*:-all-' command =git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

setopt transient_rprompt # 右側まで入力がきたら時間を消す
setopt prompt_subst
bindkey -v  # -v:vi  -e:emacs

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
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
HISTFILE=$HOME/.zsh_history # historyファイル
HISTSIZE=10000 # ファイルサイズ
SAVEHIST=10000 # saveする量
setopt hist_ignore_dups # 重複を記録しない
setopt hist_ignore_all_dups # 重複を記録しない
setopt hist_reduce_blanks # スペース排除
setopt share_history # 履歴ファイルを共有
setopt EXTENDED_HISTORY # zshの開始終了を記録
setopt append_history # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt inc_append_history # 履歴をインクリメンタルに追加
setopt hist_no_store # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks # 余分な空白は詰めて記録
HISTORY_IGNORE="(c|u|[bf]g|cd|top|ps *|l[ahlst]#( *)#|less *|exit|pwd|\$\?|kill#( *)#)|git pull|git st|git b|git diff|git pr"

zshaddhistory() {
    emulate -L zsh
    [[ ${1%%$'\n'} != ${~HISTORY_IGNORE} ]]
}

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
if which dircolors > /dev/null 2>&1 ; then
  if [ -f "${HOME}/.dircolors" ]; then
    eval $(dircolors -b ${HOME}/.dircolors)
  else
    eval `dircolors`
  fi
  alias ll="ls -laF --color=auto"
  alias la="ls -FCa --color=auto"
  alias ls="ls -F --color=auto"
  alias lt="ls -lt --color=auto"
else
  alias ll="ls -laF"
  alias la="ls -FCa"
  alias ls="ls -F"
  alias lt="ls -lt"
fi
alias rm="rm -i"
alias rmd="rm -ir"
alias vi="TERM=xterm-color vim"
alias vim="TERM=xterm-color vim"
alias make="gmake"
alias svn="env LANG=C svn"

COMMAND_DIFF=`which colordiff`
if [ "$?" -eq "0" ]; then
  alias diff="$COMMAND_DIFF -u"
else
  COMMAND_DIFF=`which colordiff.pl`
  if [ "$?" -eq "0" ]; then
    alias diff="$COMMAND_DIFF -u"
  else
    alias diff="diff -U 0"
  fi
fi

COMMAND_MULTITAIL=`which multitail`
if [ "$?" -eq "0" ]; then
  alias tail="$COMMAND_MULTITAIL"
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

# 補完候補をハイライトする
zstyle ':completion:*:default' menu select=2

# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}%B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# ファイル補完候補に色をつける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

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

# zplug install
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "zchee/go-zsh-completions", use:src/
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-autosuggestions"

function zplug-stdin() {
  if ! zplug check --verbose; then
    printf 'Install? [y/N]: '
    if read -q; then
      echo; zplug install
    fi
  fi
  
  zplug load --verbose
}

[ -f ~/.zshrc.local ] && source ~/.zshrc.local # 設定ファイルのinclude
typeset -U path cdpath fpath manpath # 重複PATHの削除
