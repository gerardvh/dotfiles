# Specify which ssh key to use
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
