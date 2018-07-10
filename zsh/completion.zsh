# matches case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' matcher-list 'm:{A-Z}={a-z}'

# match within words (not just at beginning of word)
zstyle ':completion:*' matcher-list '+l:|=* r:|=*'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# default to file completion
zstyle ':completion:*' completer _expand _complete _files _correct _approximate
