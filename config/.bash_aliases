alias cdd='cd ~/desktop'
alias cdh='cd ~/htdocs'
alias cdl='cd ~/libs'
alias cdm='cd ~/michalspacek'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias cat='batcat'
alias crontab='crontab -i'
alias diggoogle='dig @8.8.8.8'
alias digcloudflare='dig @1.1.1.2'
alias digcf='dig @1.1.1.2'
alias df='df --human-readable'

diff_color_highlight() {
	git diff --color $@ | perl /usr/share/doc/git/contrib/diff-highlight/diff-highlight
}
alias diff='diff_color_highlight'

alias hh=hstr

alias ll='exa --long --all --color-scale --time-style=long-iso --classify'
