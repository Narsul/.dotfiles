# load theme
# $(antibody bundle denysdovhan/spaceship-prompt)
$(antibody bundle eendroroy/alien-minimal)

# OH-MY_ZSH plugins
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/aws)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/brew)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/colored-man-pages)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/colorize)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/git)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/iterm2)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/node)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/npm)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/vscode)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/web-search)
$(antibody bundle robbyrussell/oh-my-zsh path:plugins/yarn)
# $(antibody bundle robbyrussell/oh-my-zsh path:plugins/per-directory-history)

$(antibody bundle marzocchi/zsh-notify)
$(antibody bundle sinetoami/antibody-completion)
$(antibody bundle lukechilds/zsh-nvm)
$(antibody bundle psprint/zsh-navigation-tools)
$(antibody bundle zsh-users/zsh-completions)
$(antibody bundle zsh-users/zsh-autosuggestions)
$(antibody bundle zsh-users/zsh-apple-touchbar)
$(antibody bundle zsh-users/zsh-syntax-highlighting)                                      # MUST be last sourced plugin
$(antibody bundle zsh-users/zsh-history-substring-search)                                 # has to be AFTER zsh-syntax-highlighting O_O

# Configuring zsh-history-substring-search plugin
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
