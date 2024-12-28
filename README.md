# Bare minimum utilities I like to have

> $ brew install tree git curl ripgrep fd stow tmux fzf lua lua-language-server neovim less zoxide eza fnm kitty parallel

## fnm and zoxide needs eval

- https://github.com/Schniz/fnm?tab=readme-ov-file#zsh
- https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#configuration

## Do I really need those?

> $ brew install bat git-delta gh mcfly

## If git-delta is really needed, read the docs

- https://github.com/dandavison/delta#git-config-file

## ZSH

> $ brew install zsh zsh-history-substring-search zsh-syntax-highlighting

## Rust (I use rust btw)

> $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Applying the dotfiles

Use [stow](https://www.gnu.org/software/stow)

> $ man stow

tl;dr

> $ stow -Rv \<folder\>

# Starship Shell

https://starship.rs/guide/#from-prebuilt-binary-with-shell

# TODO
- Create a script that syncs catpuccin theme github (kitty, allacrity, etc)
- Drop startship, including mention at the README
- Cleanup nvim plugins
