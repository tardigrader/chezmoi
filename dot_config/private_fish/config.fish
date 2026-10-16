if status is-interactive
# Commands to run in interactive sessions can go here
  starship init fish | source
  set fish_color_valid_path # Remove underlined paths
  set -gx EDITOR /usr/bin/nvim
  set -gx PAGER /usr/bin/less
  # FZF colorschemes
  #
  # tomasr/molokai
  set FZF_THEME_MOLOKAI '--color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672'
  #
  # arcticicestudio/nord-vim
  set FZF_THEME_NORD '--color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1'
  #
  # morhetz/gruvbox
  set FZF_THEME_GRUVBOX '--color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'
  #
  # papercolor
  set FZF_THEME_PAPERCOLOR ' --color=fg:#4d4d4c,bg:#eeeeee,hl:#d7005f,fg+:#4d4d4c,bg+:#e8e8e8,hl+:#d7005f,info:#4271ae,prompt:#8959a8,pointer:#d7005f,marker:#4271ae,spinner:#4271ae,header:#4271ae'

  export FZF_DEFAULT_OPTS="--height 60% \
    --preview 'bat --color=always {}' \
    --preview-window '~3' \
    $FZF_THEME_MOLOKAI"
end
