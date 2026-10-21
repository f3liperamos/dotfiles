# Bare minimum utilities I like to have

> $ brew install tree git curl ripgrep fd tmux fzf lua lua-language-server neovim less zoxide eza fnm kitty parallel fish

## fnm and zoxide needs eval

Both fnm and zoxide need to eval or source the script. Maybe chezmoi is already configured
to include those for kitty or alacrity. Double check later

- https://github.com/Schniz/fnm?tab=readme-ov-file#zsh
- https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#configuration

## atuin

It is better to install atuin using the script rather than package manager, so it proper sets the `.atuin` folder

- https://docs.atuin.sh/guide/installation/

## Fonts

- https://github.com/be5invis/Iosevka

## Do I really need those?

> $ brew install bat git-delta gh

## If git-delta is really needed, read the docs

- https://github.com/dandavison/delta#git-config-file

## ZSH

> $ brew install zsh zsh-history-substring-search zsh-syntax-highlighting

## Rust (I use rust btw)

> $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

Install zellij, tealdeer, and tree-sitter-cli using cargo

# Applying the dotfiles

Use [chezmoi](https://www.chezmoi.io/install/#one-line-package-install)

> sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin

Create a configuration file and add required variables

> mkdir -p $HOME/.config/chezmoi/ && touch $HOME/.config/chezmoi/chezmoi.toml

Init

> chezmoi init git@github.com:f3liperamos/dotfiles.git --branch chezmoi

# TODO

- Create a script that syncs catpuccin theme github (kitty, allacrity, etc)
