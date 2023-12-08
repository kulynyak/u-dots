#!/bin/zsh

alias vl="NVIM_APPNAME=LazyVim nvim"
alias vc="NVIM_APPNAME=NvChad nvim"
alias va="NVIM_APPNAME=AstroNvim nvim"
alias vp="NVIM_APPNAME=NvPunk nvim"

function nvims() {
  items=("default" "LazyVim" "NvChad" "AstroNvim" "NvPunk")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config » " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim "$@"
}

bindkey -s ^v "nvims\n"



function drop_vim() {
    local name=$1
    # Exit if name is empty or contains only spaces
    if [[ -z "${name// /}" ]]; then
        echo "No name provided. Exiting."
        return
    fi
    # Get current date and time in the specified format
    local datetime=$(date "+%Y-%m-%d-%H-%M-%S")

    # Check and remove directories, print status
    for dir in ~/.local/share/$name ~/.local/state/$name ~/.cache/$name; do
        if [[ -d $dir ]]; then
            rm -rf $dir
            echo "$dir deleted."
        else
            echo "$dir does not exist."
        fi
    done
    # Rename directory in ~/.config if it exists
    if [[ -d ~/.config/$name ]]; then
        mv ~/.config/$name ~/.config/${name}-${datetime}
        echo "~/.config/$name renamed to ~/.config/${name}-${datetime}."
    else
        echo "~/.config/$name does not exist."
    fi
}

