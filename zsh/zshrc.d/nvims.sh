#!/bin/zsh

alias vl="NVIM_APPNAME=LazyVim nvim"
alias vc="NVIM_APPNAME=NvChad nvim"
alias va="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config » " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^v "nvims\n"


