# base-files version 4.0-4
# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

export PS1='\u:\w: \n$ '
# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
#[[ -f /etc/bash_completion ]] && . /etc/bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"
export HISTSIZE=100000
export HISTFILESIZE=100000


export EDITOR=vim

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
alias ls='ls -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

alias cdw='cd ~/workspaces'
alias cdm='cd ~/workspaces/mule'
alias cde='cd ~/workspaces/elixir'
alias cdp='cd ~/workspaces/phoenix'
alias cdt='cd ~/tools'
alias gemspec='vi *.gemspec'

alias lsr='ls -lrt'
alias cdi='cd /cygdrive/c/Users/cgorshing/.IntelliJIdea10/system/tomcat'
alias depAnalyze='mvn dependency:analyze'
alias depTree='mvn dependency:tree > depTree'
alias surefire-grep='grep -H "Tests run" target/surefire-reports/*.txt | grep FAILURE'
alias fails='vi target/surefire-reports/munit.*'
function skipTests() {
  mvn clean package -DskipMunitTests "$@"
}
export -f skipTests


alias dor='cd ~/workspaces/dor; ls'
alias mcp='mvn clean package'
alias mct='mvn clean test'
alias incrementVersion='mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.nextIncrementalVersion}-SNAPSHOT versions:commit'

alias skipTests='mvn clean package -DskipTests'
alias skipJustMunitTests='mvn clean package -DskipMunitTests'
alias how-runTests='echo mvn clean test -Dmunit.test=.*my-test.*#.*test-scenario-1.*'
alias how-oneTest='echo mvn clean test -Dmunit.test=.*my-test.*#.*test-scenario-1.*'
alias how-singleTest='echo mvn clean test -Dmunit.test=.*my-test.*#.*test-scenario-1.*'
alias how-remove-quarantine='echo xattr -r -d com.apple.quarantine *'
alias how-checkout-remote-branch='echo git checkout --track origin/feature/daves_branch'
alias how-git-list-tags="git for-each-ref --format='%(if)%(committerdate)%(then)%(committerdate)%(else)%(*committerdate)%(end) %(refname:lstrip=2)' refs/tags/*"
function how-jq() {
echo "grep -o 'flow=startProjectProcess action=started payload={.*}' 58ef9d72e4b00ff95c918a8c.594d33d8e4b08a891f4462ff-0.log  | grep -o {.*}  | jq -c '. | select(.projectSfdcId | contains(\"a27c0000005ROfDAAW\"))'"
}

alias how-restore-postgres='psql -d gens_dev -f gens-db-20180131-2043.bkup'

alias make-test-jar='mvn clean org.apache.maven.plugins:maven-jar-plugin:test-jar'

alias how-start-splunk='/Applications/Splunk/bin/splunk start'
alias start-splunk='/Applications/Splunk/bin/splunk start'


alias test-ping='ping 8.8.8.8'

alias how-gitDeleteCommit='echo git reset --hard HEAD^ '

alias directorySize='du -hcs '

function prettyXml {
  echo $1
  xmllint --format $1 > $1.a_longer_extension_to_ensure_unique
  mv $1.a_longer_extension_to_ensure_unique $1
}

function time-entries {
echo bash toggl.sh add '.... message goes here ....' @ProjectName 2016-11-04 d9:15
echo bash toggl.sh add '.... message goes here ....' @ProjectName 2016-11-03T18:30 2016-11-03T20:30
}

PATH=$PATH:/Users/cgorshing/tools/toggl-cli

alias how-ssh-get-pub-from-private='ssh-keygen -y -f ~/.ssh/id_rsa'

set -o vi


alias grd='./gradlew'
alias g='git status'
#alias gti='(afplay -v 100 ~/Downloads/engine.wav &); git'
alias t='tig'
alias gpr='git pull --rebase'

alias ga='git add '
#alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

alias gt='./gradlew tasks'
alias gb='./gradlew build'

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export GREP_OPTIONS="--binary-files=without-match --color=auto --devices=skip --exclude-dir=CVS --exclude-dir=.libs --exclude-dir=.deps --exclude-dir=.svn"

#export PS1='\u:\w: \n$ '
#export PS1='[\u:\w$(__git_ps1 " (%s)")]\n\$ '
export PS1='\u:\w$(__git_ps1 " (%s)")\n\$ '




export MAVEN_OPTS=-Xmx512m

export LIQUIBASE_HOME=/usr/local/opt/liquibase/libexec

get_script_dir () {
     SOURCE="${BASH_SOURCE[0]}"
     while [ -h "$SOURCE" ]; do
          DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
          SOURCE="$( readlink "$SOURCE" )"
          [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
     done
     $( cd -P "$( dirname "$SOURCE" )" )
     pwd
}


[[ -f $(get_script_dir)/clientrc ]] && . $(get_script_dir)/clientrc
#[[ -f ./clientrc ]] && . ./clientrc

echo 'Many things have been turned off that mainly are not used or needed'
echo 'rvm, nvm, chef'
echo 'Try turnOn<Tab><Tab> to see options'
function turnOnNVM() {
  export NVM_DIR="/Users/cgorshing/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}

export PATH=$PATH:/Users/cgorshing/tools/terraform_0.6.16_darwin_amd64
export PATH=$PATH:/Users/cgorshing/bin
export PATH=$PATH:/Users/cgorshing/tools/apache-maven-3.5.0/bin
export GRADLE_HOME=/Users/cgorshing/tools/gradle-5.2.1
export GROOVY_HOME=/Users/cgorshing/tools/groovy-2.4.12
export PATH=$PATH:$GRADLE_HOME/bin:$GROOVY_HOME/bin

#Open files with:
#$ ij foo
alias ij='open -b com.jetbrains.intellij'
alias sl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

alias dls='docker container ls'

alias jenkins-stop='sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist'
alias jenkins-start='sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist'

alias java8="export JAVA_HOME=`/usr/libexec/java_home -v1.8*`"
alias java9="export JAVA_HOME=`/usr/libexec/java_home -v 9*`"
alias java11="export JAVA_HOME=`/usr/libexec/java_home -v 11*`"
export JAVA_HOME=`/usr/libexec/java_home -v 11*`
#export JAVA_HOME=$(/usr/libexec/java_home)

export PATH=$PATH:/usr/local/sbin

#export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
launchctl setenv PATH $PATH

#XDG-spec
#https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html

function turnOnRVM() {
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
}

function update-brew() {
  brew update && brew upgrade && brew cleanup && brew cleanup --prune-prefix
  # echo 'Not doing "brew prune" anymore - cause it is deprecated'
}

function update-upstream() {
  git fetch upstream
  git checkout master
  git merge upstream/master
}

function update-git() {
  for D in *
  do
    [ -d "${D}/.git" ] && echo -n "$D " && git -C "$D" pull --rebase
  done
}

function turnOnASDF() {
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
}

