#!/bin/bash
set -euo pipefail # https://buildkite.com/docs/pipelines/writing-build-scripts#configuring-bash

if [[ $USER != "acarpentier" ]];then 
    "This script must be run with acarpentier user" && exit 1
fi

sudo apt update && apt upgrade -y && apt autoremove -y && apt autoclean -y
sudo apt install zsh micro direnv -y

# Configure git
git config --global user.name "Adrien Carpentier"
git config --global user.email me@adriencarpentier.com
git config --global core.editor micro
git config --global init.defaultBranch main
git config --global user.signingkey ~/.ssh/id_ed25519.pub
# git config --global commit.gpgsign true

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Create a oh-my-zsh custom prompt theme
sudo echo $'
PROMPT="%{%(!.$fg_bold[red].$fg_bold[green])%}$USER" # User: if elevated privileges show red text, green otherwise
PROMPT+="%{$fg_bold[white]%}@"
PROMPT+="%{$fg_bold[red]%}%M" # Hostname
PROMPT+=\'%{$fg_bold[cyan]%}%d%{$reset_color%} $(git_prompt_info)\' # Path and git info
PROMPT+="%(?:%{$fg_bold[green]%}➜%{$reset_color%} :%{$fg_bold[red]%}➜%{$reset_color%} )" # Prompt symbol

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"' >> ~/.oh-my-zsh/custom/themes/bolino.zsh-theme

# Configure ~/.zshrc
sudo echo $'
# Set oh-my-zsh name of the theme to load
ZSH_THEME="bolino"

# Oh-my-zsh plugins
plugins=(colored-man-pages direnv git zsh-autosuggestions zsh-syntax-highlighting)

# Set the default text editor, set the standardized VISUAL and EDITOR environment variables
export VISUAL=micro
export EDITOR="$VISUAL"

# Aliases
alias ll='ls -alFh'
alias l='ls -lFh'

# Direnv - to load and unload environment variables depending on the current directory - see https://direnv.net/
eval "$(direnv hook zsh)"' >> ~/.zshrc
