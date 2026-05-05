# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/asher/.lmstudio/bin"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

path+=('~/scripts')
export PATH

#export https_proxy=http://127.0.0.1:6152
#export http_proxy=http://127.0.0.1:6152
#export all_proxy=socks5://127.0.0.1:6153

export ANTHROPIC_AUTH_TOKEN="$(< ~/.config/claude/ANTHROPIC_AUTH_TOKEN)"
