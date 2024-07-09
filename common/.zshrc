# Configure oh-my-zsh if installed
export ZSH="$HOME/.oh-my-zsh"
if [[ -f $ZSH/oh-my-zsh.sh ]]; then
    plugins=(git zsh-autosuggestions)
    source $ZSH/oh-my-zsh.sh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
fi


## Functions
# List files in destination when changing directory -- use `builtin cd` to override
function cd {
	builtin cd "$@" && ls
}
