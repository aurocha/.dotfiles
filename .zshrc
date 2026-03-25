# ~/.zshrc

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS      # Don't save duplicate commands
setopt HIST_IGNORE_SPACE     # Don't save commands starting with a space
setopt SHARE_HISTORY         # Share history across terminals

# --- Completion ---
autoload -Uz compinit && compinit
setopt MENU_COMPLETE         # Auto-select first completion match
setopt AUTO_LIST             # List choices on ambiguous completion
setopt COMPLETE_IN_WORD      # Complete from both ends of a word

# --- Path ----
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:/opt/platform-tools:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:/opt/platform-tools:$PATH"
fi
export PATH

# --- Aliases ---
test -s ~/.alias && . ~/.alias || true
alias ll='ls -la'
alias gs='git status'
alias gco='git checkout'
alias gpo='git push origin'
alias ..='cd ..'
alias ...='cd ../..'

# Style completions
zstyle ':completion:*' menu select           # Arrow-key navigable menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # Colored completions

# --- Navigation ---
setopt AUTO_CD               # Type a directory name to cd into it
setopt AUTO_PUSHD            # Push dirs onto stack automatically
setopt PUSHD_IGNORE_DUPS     # No duplicate dirs in stack

# --- Misc ---
setopt CORRECT               # Suggest corrections for mistyped commands
setopt INTERACTIVE_COMMENTS  # Allow comments in interactive shell

# --- Key Bindings ---
bindkey -e                   # Emacs key bindings (Ctrl+A, Ctrl+E, etc.)
bindkey '^[[A' history-search-backward  # Up arrow: history search
bindkey '^[[B' history-search-forward   # Down arrow: history search

# --- Prompt (simple, no plugins needed) ---
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
# PROMPT='%F{cyan}%~%f%F{yellow}${vcs_info_msg_0_}%f %# 'iprop
PROMPT='%F{blue}%B%~%b%f %F{green}'"$(printf '\u279c')"'%f $(git branch --show-current 2>/dev/null | sed "s/^/%F{cyan}[/;s/$/%f] /")$(git status --porcelain 2>/dev/null | grep -q . && echo "%F{red}*%f ")'

# # --- Always launch or reattach onto a tmux window ---
# if [ -z "$TMUX" ]
# then
# 	tmux -u attach -t TMUX || tmux -u new -s TMUX
# fi
