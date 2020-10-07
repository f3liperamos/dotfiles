## Install things (GOAL - setup.sh, OSX and Linux)


# Main stuff
> $ brew install tree git curl bat ripgrep fd stow tmux starship zsh fzf Schniz/tap/fnm

# ZSH
> $ brew install zsh zsh-history-substring-search zsh-syntax-highlighting

# Rust
> $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Neovim Stuff
*Remove --HEAD if LSP isn't restricted to nightly anymore*

> $ brew install --HEAD neovim

https://github.com/junegunn/vim-plug#neovim

https://github.com/junegunn/fzf.vim#using-vim-plug


# Applying the dotfiles
> $ stow <folder>

Update bat to apply the theme:
> $ bat cache --build
