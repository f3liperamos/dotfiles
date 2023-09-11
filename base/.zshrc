# PATH
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

# zsh plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Load auto completions
autoload -Uz compinit && compinit

# FZF Defaults
export FZF_DEFAULT_OPTS='--reverse'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# I said, the real editor
export EDITOR='nvim'

# Local specific overrides.
LOCAL_RC=$HOME/.zshrc.local
test -f $LOCAL_RC && source $LOCAL_RC

# Start FNM
eval "$(fnm env)"

# Start zoxide
eval "$(zoxide init zsh)"

# Start McFly
eval "$(mcfly init zsh)"

# And then finally, Starship
eval "$(starship init zsh)"
