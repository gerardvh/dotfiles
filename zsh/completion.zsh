# matches case insensitive
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# match within words (not just at beginning of word)
zstyle ':completion:*' matcher-list '+l:|=* r:|=*'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
