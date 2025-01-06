# PROMPT_COMMAND='history -a'
# export PATH=/c/usr/node:/c/msys64/usr/bin:/c/msys64/usr/x86_64-pc-msys/bin:/c/msys64/ucrt64/bin:/c/msys64/mingw64/bin:/c/msys64/mingw64/x86_64-w64-mingw32/bin:/c/msys64/clangarm64/bin:/c/msys64/mingw32/bin:/c/msys64/clang32/bin:/c/msys64/clang64/bin:!:/c/Windows/system32:/c/Windows:/c/Windows/System32/Wbem:/c/Windows/System32/WindowsPowerShell/v1.0:/c/Windows/System32/OpenSSH:/c/Golang/bin:/c/Users/thuy.tranvan/.cargo/bin:/c/Users/thuy.tranvan/AppData/Local/Microsoft/WindowsApps:/clang64/bin:/ucrt64/bin:/usr/bin:/clang32/bin:/mingw32/bin:/mingw64/bin:/c/usr/node:/c/usr/nvim-win64/bin:/c/Users/thuy.tranvan/bin:/c/Users/thuy.tranvan/bin/nvim-win64/bin:/c/Users/thuy.tranvan/bin/node-v16.17.1-win-x64:/c/Users/thuy.tranvan/bin/jdk1.8.0_341/bin:/c/Users/thuy.tranvan/bin/apache-maven-3.6.3/bin:/c/Users/thuy.tranvan/go/bin:$PATH

# D_PROGRAMS="/d/program-files"
# P_MAVEN="$D_PROGRAMS/apache-maven-3.6.3/bin"
# P_JAVA="$D_PROGRAMS/Java/jdk1.8.0_341"
# P_NODEJS="$D_PROGRAMS/node-versions/node-v16.17.1-win-x64"
# P_TREE="$D_PROGRAMS/tree/bin"
# P_ZIP="$D_PROGRAMS/zip/bin"

# export JAVA_HOME=$P_JAVA
# export PATH=$P_ZIP:$P_TREE:$P_MAVEN:$P_JAVA:$P_NODEJS:$PATH

# source ~/.dotfiles/.rivo_profile
# source ~/.share/fd.bash

sonar_token="sonar.token=sqa_71c3296e1735affd607e965aaecce0797feaf160"
sonar_prj="sonar.projectKey=ft-product-issuance-new"
sonar_src="sonar.sources=."
sonar_opts="-D$sonar_prj -D$sonar_src -D$sonar_token"
sonar_scanner="c:/usr/sonar-scanner-4.8.0.2856-windows/bin/sonar-scanner.bat"
alias sonar="$sonar_scanner $sonar_opts"
alias rg="rg --path-separator // $@"
alias ..="cd .."

alias xl="explorer $@"
alias todo="nvim -c 'e ~/.md/todo.md' -c 'vsplit ~/.md/doing.md' -c 'vsplit ~/.md/paused.md'"
alias note="nvim ~/.md/note.md"
alias spent="nvim -u null ~/.md/spent.md"
alias compare="diff -u --color --strip-trailing-cr $@"
alias lg="lazygit"
alias ll="ls -l $@"
alias la="ls -la $@"
alias rgg="rg --no-require-git $@"
alias poweroff="shutdown.exe -s -f -t 0"
alias reboot="shutdown -r -f -t 0"
alias push="git push $1 git branch | rg '\* ' | awk '{print $2}'"
alias edit="[ -e ./edit.sh ] && sh edit.sh"
alias gut="gitui $@"
alias rmfr="nmuidi $@" # https://github.com/Dillonb/nmuidi
alias nvid="neovide $@ & disown"
alias fd1="fd --maxdepth 1 $@"
alias chad="NVIM_APPNAME=nvim-chad nvim"

stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

togif() {
  file=$1
  ffmpeg -i "$file" -r 20 "${file%.*}.gif"
}

zd() {
  local search_root="${1:-$HOME}"
  local destination=$(fd . -E 'node_modules' -E '.git' -t d -d 3 $search_root | fzf)
  [[ -n $destination ]] && cd $destination
}

scdep() {
  cat package.json | grep -oh '@surecomp.*":' | tr -s '":\n' ' '
}

aws_auth_docker() {
  sh ~/.scripts/aws-auth-docker.sh
}

aws_auth_maven() {
  sh ~/.scripts/aws-auth-maven.sh
}

aws_login() {
  sh ~/.scripts/aws-login.sh
  aws_auth_docker
  aws_auth_maven
}

cht() {
  query=`echo $@ | tr ' ' '+'`
  echo cheat.sh/$query
  curl -s cheat.sh/$query
}
