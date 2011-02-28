# Lines configured by zsh-newuser-install
# HISTFILE=~/.histfile
# HISTSIZE=10000
# SAVEHIST=1000

 # не совсем ясно, для чего нужны эти парамсы
 # редактирование в стиле emacs
bindkey -e
    # редактирование в стиле Vi/Vim
#bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# ??? really needed?
# zstyle :compinstall filename '/home/admin/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall

# MY SETTINGS BEGINNING

cdpath=(~/madness_product)

# пробуем отключить авто дополнение
# zstyle ':completion:*' use-compctl false

# включим подсветку текущего варианта
zmodload zsh/complist

# подгружаем еще всякой фигни)
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile


zstyle ':completion:*' menu yes select

#zstyle ':completion:*' completer _complete _list _oldlist _
# expand _ignored _match _correct _approximate _prefix
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' add-space true

# отключения стандартных функций автодополнентя
zstyle ':completion:*:functions' ignored-patterns '_*'

# отключиние чувствительности к регистру при дополнениях
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# подсветка элементов в зависимости от типа
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# enter при автодополнениии 
# bindkey -M menuselect "^M" .accept-line
bindkey -M menuselect "/" accept-and-infer-next-history

#set prompt string
## Обычное приглащение вида ~%=>
### (каталог от домашнего - пользователь/root - стрелка)
PROMPT='%~ %# '

### Приглашения для второй линии мноргострочных команд
### вида #_строки>
PROMPT2='%i%U> '

### Приглашение с правой стороны экрана вида
### 19:15 vc/5 (время - номер консоли)
RPROMPT=' %T'


## Установка нормального поведения клавиш Delete, Home, End и т.д.:
case $TERM in
        linux)
        bindkey "^[[2~" yank
        bindkey "^[[3~" delete-char
        bindkey "^[[5~" up-line-or-history
        bindkey "^[[6~" down-line-or-history
        bindkey "^[[1~" beginning-of-line
        bindkey "^[[4~" end-of-line
        bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
        bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
        bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
        bindkey " " magic-space ## do history expansion on space
        ;;
        *xterm*|rxvt|(dt|k|E)term)
        bindkey "^[[2~" yank
        bindkey "^[[3~" delete-char
        bindkey "^[[5~" up-line-or-history
        bindkey "^[[6~" down-line-or-history
        bindkey "^[[7~" beginning-of-line
        bindkey "^[[8~" end-of-line
        bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
        bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
        bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
        bindkey " " magic-space ## do history expansion on space
        ;;
esac

# Указание путей к man-страницам.
manpath="/usr/man:/usr/share/man:/usr/local/man:/usr/X11R6/man:/opt/qt/doc"
export MANPATH

# Настроим файл истории
HISTFILE=~/.zshistory

## Число команд, сохраняемых в HISTFILE
SAVEHIST=5000

### Чucлo koмaнg, coxpaняeмыx в сеансе
HISTSIZE=5000
    ### Примечание:
    ### рекомендуются равные значения для
    ### SAVEHIST и HISTSIZE

setopt  APPEND_HISTORY

## Игнopupoвaть вce пoвтopeнuя команд
setopt  HIST_IGNORE_ALL_DUPS
#
### Игнopupo лишние пpoбeлы
setopt  HIST_IGNORE_SPACE

### Удалять из файл истории пустые строки
setopt  HIST_REDUCE_BLANKS

# Установка-снятие опций шелла
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

# ## Отключение звукового сигнала
# ## при ошибках
setopt  No_Beep

# ## Воткнем пральый редактор комментов для коммита
# external redaktom = vim
export EDITOR=vim

#-------------------
## Personnal Aliases
##-------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
# 
alias free='free -m'
alias e='vim -p'

alias h='history'
alias j='jobs -l'

alias du='du -kh'
alias df='df -kTh'
alias g='grep -Ri --colour --exclude="*git*"'
alias ll='ls -la'

# rails aliases
#alias rss='./script/server'
alias rss='thin start '
alias rsc='./script/console'

alias mmm='echo "work"'
#[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

#     # git aliases
alias gst='git status'
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias gl="git pull"
#alias gl='git pull origin master && git submodule init && git submodule update'

# page up / page down
[[ -z "$terminfo[kpp]" ]] || bindkey -M menuselect "$terminfo[kpp]" vi-backward-word
[[ -z "$terminfo[kdp]" ]] || bindkey -M menuselect "$terminfo[kdp]" vi-forward-word

# undo last autocomplete
bindkey -M menuselect "^H" undo

# /etc/bashrc

# System wide functions and aliases
# Environment stuff goes in /etc/profile

# By default, we want this to get set.
# Even for non-interactive, non-login shells.
if [ $UID -gt 99 ] && [ "`id -gn`" = "`id -un`" ]; then
	umask 002
else
	umask 022
fi

# are we an interactive shell?
if [ "$PS1" ]; then
    case $TERM in
	xterm*)
		if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
			PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
		else
	    	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'
		fi
		;;
	screen)
		if [ -e /etc/sysconfig/bash-prompt-screen ]; then
			PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
		else
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\033\\"'
		fi
		;;
	*)
		[ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
	    ;;
    esac
    # Turn on checkwinsize
    #shopt -s checkwinsize
    [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
fi

source /Users/evgenp/.rvm/scripts/rvm

#if ! shopt -q login_shell ; then # We're not a login shell
#	# Need to redefine pathmunge, it get's undefined at the end of /etc/profile
#    pathmunge () {
#		if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
#			if [ "$2" = "after" ] ; then
#				PATH=$PATH:$1
#			else
#				PATH=$1:$PATH
#			fi
#		fi
#	}
#
#	for i in /etc/profile.d/*.sh; do
#		if [ -r "$i" ]; then
#			. $i
#	fi
#	done
#	unset i
#	unset pathmunge
#fi
# vim:ts=4:sw=4

alias swa='sudo -i -u'
alias clear_svn="find ./ -name '.svn' -exec rm -rf {} \;"

alias nginx="sudo /usr/local/nginx/sbin/nginx"
alias nginx_reload="sudo kill -HUP `cat /usr/local/nginx/logs/nginx.pid`"
alias nginx_tops "sudo kill -15 $(ps -auxxx | egrep "[n]ginx.*master" | awk '{ print $2 }') 2>/dev/null"

alias spinxd "sudo /usr/local/Cellar/sphinx/0.9.9/bin/searchd"

#export rvm_pretty_print_flag=1
#rvm_project_rvmrc_default=1


#if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi
#[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion
