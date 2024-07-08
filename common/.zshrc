# Configure oh-my-zsh if installed
export ZSH="$HOME/.oh-my-zsh"
if [[ ! -f $ZSH/oh-my-zsh.sh ]]; then
    plugins=(git zsh-autosuggestions)
fi


## Functions
# List files in destination when changing directory -- use `builtin cd` to override
function cd {
	builtin cd "$@" && ls
}
