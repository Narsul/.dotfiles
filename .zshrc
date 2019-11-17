# # zsh loading profiling
# zmodload zsh/zprof

# load completion system
autoload -Uz compinit
compinit

# Set nano as a default editor
export EDITOR="nano"

# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# load @onereach access token
source ${HOME}/.onereach/env

# # Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

export ZSH_CACHE_DIR="${HOME}/.zsh/cache"

# loading dotfiles zsh extensions
for file in ${DOTFILES}/zsh/*.zsh; do
  [ -e "$file" ] || continue
  extension=$(basename $file)
  source "${DOTFILES}/zsh/$extension"
done

# NVM
export NVM_AUTO_USE=true
if [ "$ELECTRON_RUN_AS_NODE" != "1" ]; then
 export NVM_LAZY_LOAD=true
fi

# # Set name of the theme to load.
# # Look in ~/.oh-my-zsh/themes/
# # Optionally, if you set this to "random", it'll load a random theme each
# # time that oh-my-zsh is loaded.
# ZSH_THEME="spaceship"

# load theme
# $(antibody bundle denysdovhan/spaceship-prompt)
$(antibody bundle eendroroy/alien-minimal)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# # Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$ZSH/custom

# # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# # Example format: plugins=(rails git textmate ruby lighthouse)
# # Add wisely, as too many plugins slow down shell startup.
# # plugins=(git git-extras)
# plugins=(
#   aws
#   brew
#   docker
#   git
#   node
#   npm
#   colorize
#   bundler
# )

# # Activate Oh-My-Zsh
# source $ZSH/oh-my-zsh.sh

# OH-MY_ZSH plugins
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/aws)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/git)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/iterm2)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/node)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/npm)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/colorize)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/bundler)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/vscode)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/web-search)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/yarn)
# $(antibody bundle robbyrussell/oh-my-zsh path:plugins/per-directory-history)

$(antibody bundle sinetoami/antibody-completion)
$(antibody bundle lukechilds/zsh-nvm)
$(antibody bundle psprint/zsh-navigation-tools)
$(antibody bundle zsh-users/zsh-autosuggestions)
$(antibody bundle zsh-users/zsh-apple-touchbar)
$(antibody bundle zsh-users/zsh-syntax-highlighting)                                      # MUST be last sourced plugin
$(antibody bundle zsh-users/zsh-history-substring-search)                                 # has to be AFTER zsh-syntax-highlighting O_O

# add bash completion for or cli tool
source ${OR_ROOT}/deploy-platform/scripts/_bash_completions.sh

# Configuring zsh-history-substring-search plugin
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# # zsh loading profiling
# zprof
