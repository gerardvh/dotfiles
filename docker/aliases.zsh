alias d='docker $*'
alias d-c='docker-compose $*'
alias docker-cleanup='docker rmi $(docker images -f "dangling=true" -q)'
