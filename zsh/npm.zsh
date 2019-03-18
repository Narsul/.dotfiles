# load @onereach access token
source $HOME/.onereach/env

# add bash completion for or cli tool
OR_ROOT=$(cat $HOME/.onereach/root)
source ${OR_ROOT}/deploy-platform/scripts/_bash_completions.sh
