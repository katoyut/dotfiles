# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias php-cs='~/.composer/vendor/bin/php-cs-fixer fix --config .php_cs --allow-risky yes'
alias ll='ls -la --color=auto'
alias vi='vim'
alias tmux='tmux -2'

# スクリーンロックのショートカットを解除
stty stop undef
stty start undef
