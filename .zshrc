# 環境変数
export LANG=ja_JP.UTF-8

# vimライクなkeybind
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# 同時に起動したzshの間でヒストリを共有
setopt share_history
# 余分なスペースを削除してヒストリに保存
setopt hist_reduce_blanks

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を詰めて表示
setopt list_packed
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''
# 補完後左右キーで選択可能
zstyle ':completion:*:default' menu select=2

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep

# prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() { vcs_info }
PROMPT='%m:%F{012}%~%f %n %F{012}$%f '
RPROMPT='${vcs_info_msg_0_}'

# alias
alias ls='ls -aF'
alias ll='ls -l'
alias rm='rm -i'
alias vi='vim'
alias cat='cat -n'
alias less='less -NM'
alias php-cs='php-cs-fixer fix --config .php_cs --allow-risky yes'
alias tmux='tmux -2'
export CLICOLOR=true
export LSCOLORS=Exfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=auto'

# スクリーンロックのショートカットを解除
stty stop undef
stty start undef

# path
# export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/projects/go
