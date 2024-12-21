#
# Aliases
#
alias nv=nvim
alias dockerps="docker ps -a --format=\"table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}\""

#
# ls
#
alias ll='ls -l -h'
alias la='ls -a'

#
# Git
#
unalias gh
unalias gs
alias ghcr="gh repo create --private --push -s ."
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gco='git checkout'
alias gcl='git clone'
alias gc='git commit'
alias gc!='git commit --amend'
alias gd='git diff'
alias gm='git merge'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gl='git pull'
alias glr='git pull --rebase --autostash -v'
alias gp='git push'
alias gpsup='git push --set-upstream origin $(git-branch-current)'
alias grb='git rebase'
alias grs='git reset'
alias grss='git reset --soft'
alias grsh='git reset --hard'
alias grm='git remote'
alias grmv='git remote -v'
alias grma='git remote add'
alias grmao='git remote add origin'
alias grms='git remote set-url'
alias grmso='git remote set-url origin'
alias gst='git status'
alias gsw='git switch'
alias gsm='git submodule'
alias gt='git tag'

#
# Conda
#
alias cn="conda"
alias cna="conda activate"
alias cnap="conda activate -p"
alias cnab="conda activate base"
alias cncf="conda env create -f"
alias cncp="conda create -y -p"
alias cncn="conda create -y -n"
alias cnd="conda deactivate"
alias cnel="conda env list"
alias cni="conda install"
alias cniy="conda install -y"
alias cnl="conda list"
alias cnr="conda remove"
alias cnre="conda env remove -n"
alias cnu="conda update"


#
# Cargo
#
alias cg="cargo"
alias cga="cargo add"
alias cgb="cargo build"
alias cgbr="cargo build --release"
alias cgc="cargo check"
alias cgi="cargo init"
alias cgn="cargo new"
alias cgr="cargo run"
alias cgs="cargo search"
alias cgt="cargo test"

#
# Docker Compose
#
alias dk="docker"
alias dka="docker attach"
alias dkb="docker build"
alias dkcu="docker compose up"
alias dkcub="docker compose up --build"
alias dkcud="docker compose up --detach"
alias dkcudb="docker compose up --build --detach"
alias dkcd="docker compose down"
alias dkce="docker compose exec"
alias dke="docker exec"
alias dkE="docker exec -it"
alias dki="docker image"
alias dkil="docker image ls"
alias dkii="docker image inspect"
alias dkirm="docker image rm"
alias dkl="docker logs"
alias dkps="docker ps"
alias dkpsa="docker ps -a"
alias dkrm="docker rm"
alias dkrmi="docker rmi"
alias dkr="docker run"
alias dkr="docker run"
alias dkR="docker run -it --rm"
alias dkRs="docker run -it --rm --entrypoint /bin/bash"
alias dks="docker start"
alias dkst="docker stop"
alias dkv="docker volume"

#
# autojump
#
alias j=z
alias pp="perf probe"
alias ppl="perf probe -L"
alias prp="perf report"
alias prc="perf record"
alias psc="perf script"
