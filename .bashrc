#
# additional tools for windows:
# * wget: http://www.gnu.org/software/wget/
# * nmap: https://nmap.org/download.html
# * nc: https://nmap.org/ncat/
#

# command prompt
source ~/bin/50_prompt.sh

# Variables
export HISTTIMEFORMAT="%d.%m.%Y %H:%M:%S "
export TIMESTAMPFORMAT="%Y%m%d%H%M%S"
export DISPLAY=localhost:0.0

## create a new set of commands ##
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias h='history'
alias du='du -h'
alias dir='ls -p --color=auto --show-control-chars'
alias ls='ls -p --color=auto --show-control-chars'
alias l='ls -l --color=auto --show-control-chars'
alias ll='ls -la --color=auto --show-control-chars'
alias l.='ls -d .* --color=auto --show-control-chars'
alias ss='stat --printf="%A\t%a\t%h\t%U\t%G\t%s\t%.19y\t%n\n"'
alias c='clear'
alias traceroute='tracert -d'
alias timestamp='date +$TIMESTAMPFORMAT'
alias html2text="w3m -dump -T 'text/html'"
alias untar="tar -zxvf"
alias cd..='cd ..'
alias ..='cd ..'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ga='git add '
alias gb='git branch '
alias gc='git commit -m'
alias gp='git push'
alias gs='git status '

# Functions
colordiff () { diff -u "$@" | sed 's/^-/\x1b[41m-/;s/^+/\x1b[42m+/;s/^@/\x1b[34m@/;s/$/\x1b[0m/'; } # http://stackoverflow.com/questions/8800578/colorize-diff-on-the-command-line
tree () { ls -RA "$@" | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'; } # http://stackoverflow.com/questions/3455625/linux-command-to-print-directory-structure-in-the-form-of-a-tree
dataURI () { cat "$@" | openssl enc -base64 | sed -s 's/\r//gim;s/\n//gim;s/^\(R0lGOD\)/data:image\/gif;base64,\1/g;s/^\(iVBORw\)/data:image\/png;base64,\1/g;s/^\(\/9j\/4\)/data:image\/jpeg;base64,\1/g;s/^\(UklGR\)/data:image\/webp;base64,\1/g;'; }
backup () { zip ~/backup/$@.`date +"%Y%m%d%H%M%S"`.zip $(find $@ -name '*' -print); };

set LANG=en_US.utf8
