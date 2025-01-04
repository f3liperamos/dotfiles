# Commands to run in interactive sessions can go here
if status is-interactive
	set -g fish_key_bindings fish_vi_key_bindings
	set -gx EDITOR nvim

	source "$HOME/.cargo/env.fish"
	fnm env --shell fish | source
	zoxide init fish | source
end
