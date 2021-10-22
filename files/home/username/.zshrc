# to set zsh as default write "chsh -s $(which zsh)" and reboot the system
# Enable colors and change prompt:
autoload -U colors && colors
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# - - - Pure Prompt - - -
autoload -Uz promptinit
promptinit
prompt pure
zstyle :prompt:pure:path color 'magenta'
# PROMPT='%(?.%F{blue}.%F{red})${PURE_PROMPT_SYMBOL:-❯}%f '
zstyle ':prompt:pure:prompt:success' color blue 
zstyle ':prompt:pure:prompt:error' color red


# - - - PATH - - -
PATH=$PATH:~/.local/bin
export JAVA_HOME=/usr/lib/jvm/java-16-openjdk
export VISUAL=nvim;
export EDITOR=nvim;
export XAMPP_ROOT=/opt/lampp;

# - - - Initial config - - -
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# - - - vi mode - - -
bindkey -v
bindkey '^R' history-incremental-search-backward
# export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action


# - - - Alias - - -
# alias ll='ls -laF --color'
alias ll='ls -lahF'
alias py='python3'
alias :q='exit'
alias q='exit'
alias fs='ranger'
alias wireshark-sudo='sudo wireshark'
alias update='/usr/bin/checkupdates'
alias installed='pacman -Qqe'
alias installed_list='pacman -Qqett'
# alias dependencies='pacman -Qi $1|grep 'Depends On'|cut -d: -f2'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias copy='xsel -b'
alias pt='xsel -p'
alias youtube-dl-mp3='youtube-dl --extract-audio --audio-format mp3'
alias share-hdmi='xrandr --output HDMI-A-0 --same-as eDP'
# alias share-hdmi='xrandr --output HDMI-A-0 --mode 1920x1080'


# Networking
alias openport='sudo lsof -i -P -n | grep LISTEN'
# alias openport='sudo ss -tulpn'
# alias openport='sudo ss -tulpn|grep -i listen'
# alias openport='sudo ss -tulwn'
# alias openport='sudo netstat -nlp'
# alias openport='sudo nmap -p- localhost'
alias ssh-term='TERM=xterm-256color ssh'

# Configuration
alias edit-bspwm='nvim ~/.config/bspwm/bspwmrc'
alias edit-coc='nvim ~/.config/nvim/coc-settings.json'
alias edit-kitty='nvim ~/.config/kitty/kitty.conf'
alias edit-lightdm='sudo nvim /etc/lightdm/lightdm.conf'
alias edit-nvim='nvim ~/.config/nvim/init.vim'
alias edit-polybar='nvim ~/.config/polybar/config'
alias edit-polylaunch='nvim ~/.config/polybar/launch.sh'
alias edit-rofi='nvim ~/.config/rofi/full.rasi'
alias edit-sxhkd='nvim ~/.config/sxhkd/sxhkdrc'
alias edit-webkit2='sudo nvim /etc/lightdm/lightdm-webkit2-greeter.conf'
alias edit-xprofile='nvim ~/.xprofile'
alias edit-zsh='nvim ~/.zshrc'
alias edit-thinkfan='sudo nvim /etc/thinkfan.conf'
alias edit-compton='nvim ~/.config/compton.conf'
alias edit-clearine='nvim ~/.config/clearine.conf'
alias edit-betterockscreen='nvim ~/.config/betterlockscreenrc'
alias edit-xinitrc='nvim ~/.xinitrc'
alias edit-javaWMdeloscojones='nvim /etc/profile.d/jre.sh'
alias edit-alacritty='nvim ~/.config/alacritty/alacritty.yml'
alias edit-ranger='cd ~/.config/ranger/ && nvim'
alias load-average="uptime | grep -ohe 'load average[s:][: ].*' | awk '{ print $3" "$4" "$5"," }' | sed 's/,//g'"
alias cdusb="cd /run/media/r0p3/"
alias cdphone="cd /run/user/1000/gvfs/"

# - - - System - - -
alias sysenable='systemctl list-unit-files --state=enabled'
alias memused="free -h|awk '/^Mem:/ {print $3  $2}'"
alias cputemp="sensors|awk '/^temp1/ {print $2}'"
alias gputemp="nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader"
alias topmem='ps axch -o cmd:15,%mem --sort=-%mem|head'
alias topcpu='ps axch -o cmd:15,%cpu --sort=-%mem|head'
alias service-enbl='systemctl list-unit-files --stte=enabled'



# Extract compressed files
function ex
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar -xjvf $1    ;;
            *.tar.gz)   tar -xzvf $1    ;;
            *.tar.xz)   tar -xJvf $1    ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar -x $1     ;;
            *.gz)       gunzip $1       ;;
            *.xz)       unxz $1         ;;
            *.txz)      tar -xJvf $1    ;;
            *.tar)      tar -xvf $1     ;;
            *.tbz2)     tar -xjvf $1    ;;
            *.tgz)      tar -xzvf $1    ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z -xv $1       ;;
            *)          echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}


# Show last 10 programs installeds, orphan packages and the cache
# Used in zsh
function clean
{
  if [ -z $1 ]; then num=10; else num=$1; fi;
  echo "LAST $num INSTALLED PACKAGES:"
  history 0 | tac | grep -m $num -e " sudo pacman -S " -e " yay -S " -e " pip3 #install "
  echo "ORPHAN PACKAGES:"
  yay -Qqtd
  echo "CACHE CLEANING:"
  paccache -v -d
}
alias clean-all='sudo pacman -Rsn $(yay -Qqtd)'


function mkt {
	mkdir {nmap,content,exploits,scripts}
}

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
