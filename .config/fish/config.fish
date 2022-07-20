function fish_greeting
    # logo
    cat ~/.config/fish/magikarp.txt
    echo ""

    # Welcome
    echo Hello fellow friend! Welcome to $hostname
    echo The time is (set_color yellow; date +%T; set_color normal). Enjoy your terminal!

    # Jumping..
    z d
end

set -gx TERM xterm-256color

# aliasses
source (dirname (status --current-filename))/alias.fish

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

set -gx EDITOR nvim

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# OS Specific configuration
switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
