# # zsh loading profiling
# zmodload zsh/zprof

# load completion system
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

# Options
setopt hist_ignore_all_dups   # remove older duplicate entries from history
setopt hist_reduce_blanks     # remove superfluous blanks from history items
setopt inc_append_history     # save history entries as soon as they are entered
setopt share_history          # share history between different instances of the shell
setopt auto_cd                # cd by typing directory name if it's not a command
setopt correct_all            # autocorrect commands
setopt auto_list              # automatically list choices on ambiguous completion
setopt auto_menu              # automatically use menu completion
setopt always_to_end          # move cursor to end if word had one match

# Improve autocompletion style
zstyle ':completion:*' menu select                                          # select completions with arrow keys
zstyle ':completion:*' group-name ''                                        # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

# Set nano as a default editor
export EDITOR="nano"

# Path to your dotfiles installation.
export DOTFILES=${HOME}/.dotfiles

# load @onereach env variables
[ -f "${HOME}/.onereach/env" ] && source "${HOME}/.onereach/env"

export ZSH_CACHE_DIR="${HOME}/.zsh/cache"

# NVM options
export NVM_AUTO_USE=true
# [ "$ELECTRON_RUN_AS_NODE" != "1" ] && export NVM_LAZY_LOAD=true

# loading dotfiles zsh extensions
for file in ${DOTFILES}/zsh/*.zsh; do
  [ -e "$file" ] || continue
  extension=$(basename $file)
  source "${DOTFILES}/zsh/$extension"
done

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# # zsh loading profiling
# zprof
