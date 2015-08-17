#/bin/bash

alias ducks='du -cks * | sort -rn | head'
alias bigf='find . -type f -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}'
