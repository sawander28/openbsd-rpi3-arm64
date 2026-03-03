. /etc/ksh.kshrc

OHMYKSH_DIR=${HOME}/src/ohmyksh

. ${OHMYKSH_DIR}/ohmy.ksh

set -A my_paths -- \
        ~/bin

paths "${my_paths[@]}"

# Load extensions
load_extension fonts
load_extension k
load_extension nocolor
load_extension openbsd

# Load completions
load_completion ssh
#load_completion vmd
#load_completion rc
#load_completion gopass
load_completion git

# the q prompt auto-loads the git-prompt extension
set_prompt q

alias ll='ls -lh'
alias la='ls -a'
alias  l='ls -lha'
