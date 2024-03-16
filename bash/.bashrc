# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Prompt config
USERNAME='\u'
HOSTNAME_COLOR='\[\e[38;5;123m\]'
HOSTNAME='\h'
RESET_COLOR='\[\e[0m\]'
WORKING_DIR_COLOR='\[\e[38;5;155m\]'
WORKING_DIR='\w'

export PS1="[${USERNAME}@${HOSTNAME_COLOR}${HOSTNAME}${RESET_COLOR}: ${WORKING_DIR_COLOR}${WORKING_DIR}${RESET_COLOR}]$ "


# Config Nussknacker
export USAGE_REPORTS_FINGERPRINT=development
source <(kubectl completion bash)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
