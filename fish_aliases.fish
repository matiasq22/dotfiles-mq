alias ssh-antell="ssh -oHostKeyAlgorithms=+ssh-dss root@192.168.2.65"
alias vpn-antell2="sudo pon antell_tunnel_personal"
alias vpn-antell2-down="sudo poff antell_tunnel_personal"
alias vpn-antell="sudo openfortivpn &"
alias vpn-antell-down="sudo killall pppd"
alias pupdate="sudo pacman -Syu"
alias pr="sudo pacman -R"
alias pi="sudo pacman -S"
alias v=nvim
alias dps="docker ps"
alias dbuild="docker build"
alias dimg="docker images"
alias dlg="docker logs"
alias drmi="docker rmi"
alias dst="docker stop"
alias drun="docker run"
alias dph="docker push"
alias dpl="docker pull"
alias dex="docker exec -it"
alias dsp="docker system prune"
alias dcps="docker-compose ps"
alias dcup="docker-compose up"
alias dcdw="docker-compose down"
alias dcrt="docker-compose restart"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias k=kubectl
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias ls=exa

#k3d completions
source /home/mq/.k3d-completion.fish


# migrating from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh
alias gdf="git diff"
alias gph="git push origin"
alias gpl="git pull origin"

# Aliases
alias g='git'
#compdef g=git
alias gst='git status'
#compdef _git gst=git-status
alias gd='git diff'
#compdef _git gd=git-diff
alias gdc='git diff --cached'
#compdef _git gdc=git-diff
alias gl='git pull'
#compdef _git gl=git-pull
alias gup='git pull --rebase'
#compdef _git gup=git-fetch
alias gp='git push'
#compdef _git gp=git-push
alias gd='git diff'

function gdv
  git diff -w $argv | view -
end

#compdef _git gdv=git-diff
alias gc='git commit -v'
#compdef _git gc=git-commit
alias gc!='git commit -v --amend'
#compdef _git gc!=git-commit
alias gca='git commit -v -a'
#compdef _git gc=git-commit
alias gca!='git commit -v -a --amend'
#compdef _git gca!=git-commit
alias gcmsg='git commit -m'
#compdef _git gcmsg=git-commit
alias gco='git checkout'
#compdef _git gco=git-checkout
alias gcm='git checkout master'
alias gr='git remote'
#compdef _git gr=git-remote
alias grv='git remote -v'
#compdef _git grv=git-remote
alias grmv='git remote rename'
#compdef _git grmv=git-remote
alias grrm='git remote remove'
#compdef _git grrm=git-remote
alias grset='git remote set-url'
#compdef _git grset=git-remote
alias grup='git remote update'
#compdef _git grset=git-remote
alias grbi='git rebase -i'
#compdef _git grbi=git-rebase
alias grbc='git rebase --continue'
#compdef _git grbc=git-rebase
alias grba='git rebase --abort'
#compdef _git grba=git-rebase
alias gb='git branch'
#compdef _git gb=git-branch
alias gba='git branch -a'
#compdef _git gba=git-branch
alias gcount='git shortlog -sn'
#compdef gcount=git
alias gcl='git config --list'
alias gcp='git cherry-pick'
#compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=10'
#compdef _git glg=git-log
alias glgg='git log --graph --max-count=10'
#compdef _git glgg=git-log
alias glgga='git log --graph --decorate --all'
#compdef _git glgga=git-log
alias glo='git log --oneline'
#compdef _git glo=git-log
alias gss='git status -s'
#compdef _git gss=git-status
alias ga='git add'
alias gac='git add . && git commit -m'
#compdef _git ga=git-add
alias gm='git merge'
#compdef _git gm=git-merge
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard; and git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

#remove the gf alias
#alias gf='git ls-files | grep'

alias gpoat='git push origin --all; and git push origin --tags'
alias gmt='git mergetool --no-prompt'
#compdef _git gm=git-mergetool

alias gg='git gui citool'
alias gga='git gui citool --amend'
alias gk='gitk --all --branches'

alias gsts='git stash show --text'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'

# Will cd into the top of the current repository
# or submodule.
alias grt='cd (git rev-parse --show-toplevel; or echo ".")'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit; and git push github master:svntrunk'
#compdef git-svn-dcommit-push=git

alias gsr='git svn rebase'
alias gsd='git svn dcommit'
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo ref | sed s-refs/heads--
end

function current_repository
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo (git remote -v | cut -d':' -f 2)
end

# these aliases take advantage of the previous function
alias ggpull='git pull origin (current_branch)'
#compdef ggpull=git
alias ggpur='git pull --rebase origin (current_branch)'
#compdef ggpur=git
alias ggpush='git push origin (current_branch)'
#compdef ggpush=git
alias ggpnp='git pull origin (current_branch); and git push origin (current_branch)'
#compdef ggpnp=git

# Pretty log messages
function _git_log_prettily
  if ! [ -z $1 ]; then
    git log --pretty=$1
  end
end

alias glp="_git_log_prettily"
#compdef _git glp=git-log

# Work In Progress (wip)
# These features allow to pause a branch development and switch to another one (wip)
# When you want to go back to work, just unwip it
#
# This function return a warning if the current branch is a wip
function work_in_progress
  if git log -n 1 | grep -q -c wip; then
    echo "WIP!!"
  end
end

# these alias commit and uncomit wip branches
alias gwip='git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m "wip"'
alias gunwip='git log -n 1 | grep -q -c wip; and git reset HEAD~1'
complete -c fnm -n "__fish_use_subcommand" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror' -r
complete -c fnm -n "__fish_use_subcommand" -l fnm-dir -d 'The root directory of fnm installations' -r
complete -c fnm -n "__fish_use_subcommand" -l multishell-path -d 'Where the current node version link is stored. This value will be populated automatically by evaluating `fnm env` in your shell profile. Read more about it using `fnm help env`' -r
complete -c fnm -n "__fish_use_subcommand" -l log-level -d 'The log level of fnm commands' -r -f -a "{quiet	,info	,all	,error	}"
complete -c fnm -n "__fish_use_subcommand" -l arch -d 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary' -r
complete -c fnm -n "__fish_use_subcommand" -l version-file-strategy -d 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation' -r -f -a "{local	,recursive	}"
complete -c fnm -n "__fish_use_subcommand" -l help -d 'Print help information'
complete -c fnm -n "__fish_use_subcommand" -l version -d 'Print version information'
complete -c fnm -n "__fish_use_subcommand" -f -a "list-remote" -d 'List all remote Node.js versions'
complete -c fnm -n "__fish_use_subcommand" -f -a "list" -d 'List all locally installed Node.js versions'
complete -c fnm -n "__fish_use_subcommand" -f -a "install" -d 'Install a new Node.js version'
complete -c fnm -n "__fish_use_subcommand" -f -a "use" -d 'Change Node.js version'
complete -c fnm -n "__fish_use_subcommand" -f -a "env" -d 'Print and set up required environment variables for fnm'
complete -c fnm -n "__fish_use_subcommand" -f -a "completions" -d 'Print shell completions to stdout'
complete -c fnm -n "__fish_use_subcommand" -f -a "alias" -d 'Alias a version to a common name'
complete -c fnm -n "__fish_use_subcommand" -f -a "unalias" -d 'Remove an alias definition'
complete -c fnm -n "__fish_use_subcommand" -f -a "default" -d 'Set a version as the default version'
complete -c fnm -n "__fish_use_subcommand" -f -a "current" -d 'Print the current Node.js version'
complete -c fnm -n "__fish_use_subcommand" -f -a "exec" -d 'Run a command within fnm context'
complete -c fnm -n "__fish_use_subcommand" -f -a "uninstall" -d 'Uninstall a Node.js version'
complete -c fnm -n "__fish_seen_subcommand_from list-remote" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from list-remote" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from list" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from list" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from install" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from install" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from install" -l lts -d 'Install latest LTS'
complete -c fnm -n "__fish_seen_subcommand_from use" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from use" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from use" -l install-if-missing -d 'Install the version if it isn\'t installed yet'
complete -c fnm -n "__fish_seen_subcommand_from use" -l silent-if-unchanged -d 'Don\'t output a message identifying the version being used if it will not change due to execution of this command'
complete -c fnm -n "__fish_seen_subcommand_from env" -l shell -d 'The shell syntax to use. Infers when missing' -r -f -a "{bash	,zsh	,fish	,powershell	}"
complete -c fnm -n "__fish_seen_subcommand_from env" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from env" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from env" -l multi -d 'Deprecated. This is the default now'
complete -c fnm -n "__fish_seen_subcommand_from env" -l use-on-cd -d 'Print the script to change Node versions every directory change'
complete -c fnm -n "__fish_seen_subcommand_from completions" -l shell -d 'The shell syntax to use. Infers when missing' -r
complete -c fnm -n "__fish_seen_subcommand_from completions" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from completions" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from alias" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from alias" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from unalias" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from unalias" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from default" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from default" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from current" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from current" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from exec" -l using -d 'Either an explicit version, or a filename with the version written in it' -r
complete -c fnm -n "__fish_seen_subcommand_from exec" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from exec" -l version -d 'Print version information'
complete -c fnm -n "__fish_seen_subcommand_from exec" -l using-file -d 'Deprecated. This is the default now'
complete -c fnm -n "__fish_seen_subcommand_from uninstall" -l help -d 'Print help information'
complete -c fnm -n "__fish_seen_subcommand_from uninstall" -l version -d 'Print version information'
