plugins=(git zsh-autosuggestions zsh-completions)

alias vim="nvim -p"
alias l="exa -la"
alias ls="exa -la"
alias la="exa -la"
alias ta="tmux a"
alias tk="tmux kill-server"
alias tl="tmux ls"
alias ts="tmux source-file ~/.tmux.conf"
alias tz="date +'%Z %z'"
alias x="chmod u+x "
alias o="xdg-open "
alias c='xclip -selection c'
alias rg="rg --ignore-case --hidden --iglob '!**/package-lock.json' --iglob '!**/.git/**' --iglob '!**/dist' --iglob '!**/yarn.lock' --iglob '!**/*.min.js' --iglob '!**/*.min.css'"
alias h="history -n"
alias rust-musl-builder='docker run --rm -it -v "$(pwd)":/home/rust/src ekidd/rust-musl-builder:nightly-2019-04-17'
alias rust-musl-builder-stable='docker run --rm -it -v "$(pwd)":/home/rust/src ekidd/rust-musl-builder'
alias afs="sudo apt-file search "
alias ss="sed -i 's/ *$//g'"
alias uu="sudo apt update --fix-missing && sudo apt upgrade"
alias gs="git status"
alias gfc="git diff --cached"
alias ga="git add"
alias gc="git checkout"
alias gm="git commit -s -m"
alias am="git commit -s --amend -m"
alias gl="git log --pretty=oneline"
alias gp="git cherry-pick -n"
alias gq="git rebase --interactive HEAD~3"
alias cr="cargo run"
alias cf="cargo fmt"
alias cb="cargo build --release"
alias ck="cargo check"
alias ct="cargo test -- --nocapture"
alias ctbin="cargo test --no-run --message-format=json | jq -r 'select(.profile.test == true) | .filenames[]'"
alias cdo="cargo doc --open"
alias clean="sudo apt clean && sudo apt autoclean && sudo apt autoremove && dpkg -l | grep ^rc | awk '{print \$2}' | sudo xargs -i dpkg -P {}"
alias doc-std='rustup doc --std'
alias doc-macro='rustup doc --proc_macro'
alias doc-example='rustup doc --rust-by-exmple'
alias doc-book='rustup doc --book'
alias doc-ref='rustup doc --reference'
alias clean-container='docker container ls -q | xargs -i docker stop {} | xargs -i docker rm {}'
alias xz='tar -Jxvf'
alias jz='tar -zxvf'
alias cmake='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1'
alias wrk='wrk -t8 -d30s -c1000'
alias visudo='sudo EDITOR=vim visudo'
alias n='nnn'
alias sccache-clean-restart='sccache -z && sccache --stop-server && sccache --start-server'
alias repo='ghs repo'
alias issues='ghs issues'
alias commits='ghs commits'
alias features='cargo whatfeatures -p'
function doc-crate {
    if [ ! -z "$1" ]; then
        cargo doc -p $1 --open
    fi
}
function ra {
    if [ ! -z "$1" ] && [ ! -z "$2" ]; then
        rg $1 -l | xargs -i sed -i "s/$1/$2/g" {}
    fi
}
function ge {
    if [ ! -z "$1" ]; then
        git fetch origin +refs/pull/$1/merge
    fi
}
function words {
    if [ ! -z "$1" ]; then
        cat $1 | tr -cs A-Za-z '\n' | tr A-Z a-z | sort | uniq -u
    fi
}
function top-words {
    if [ ! -z "$1" ] && [ ! -z "$2" ]; then
        cat $1 | tr -cs A-Za-z '\n' | tr A-Z a-z | sort | uniq -c | sort -rn | awk '{print $2}' | head -n $2
    fi
}
function changelog {
    if [ ! -f "changelog.md" ]; then
        clog -r https://github.com/clog-tool/clog-cli --outfile changelog.md
    else
        clog -r https://github.com/clog-tool/clog-cli --infile changelog.md --outfile tmp.md
        rm changelog.md
        mv tmp.md changelog.md
    fi
}
function details {
    printf "<details>\n\t<summary>Details</summary>\n\tSomething small enough to escape casual notice.\n</details>"
}

export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export GOENV_ROOT="$HOME/.goenv"
export CARGO_HOME="$HOME/.cargo"
export DENO_INSTALL="$HOME/.deno"
export JAVA_HOME="$(java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' | awk -F= '{print $2}' | tr -d '[:space:]')"
export ANDROID_HOME="$HOME/Android/Sdk"
export DART_HOME="/usr/lib/dart"
export FLUTTER_HOME="$HOME/flutter"
export PUB_HOME="$HOME/.pub-cache"
export SCRIPT_HOME="$HOME/.bin"
export PATH="$CARGO_HOME/bin:$GOPATH/bin:$GOROOT/bin:$DENO_INSTALL/bin:$FLUTTER_HOME/bin:$DART_HOME/bin:/usr/local/go/bin:$PUB_HOME/bin:$ANDROID_HOME/tools/bin:$ANDROID_HOME/tools:$ANDROID_HOME/emulator:$GOENV_ROOT/bin:$SCRIPT_HOME:$PATH"
export TERM=xterm-256color
export EDITOR=nvim
export GITHUB_API_TOKEN=""
export GITLAB_PRIVATE_TOKEN=""
export FZF_DEFAULT_COMMAND="fd --type f --exclude .git --exclude node_modules --exclude third-party --exclude vendor --exclude target --exclude Cargo.lock --exclude yarn.lock --exclude package-lock.json --follow --hidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export GO111MODULE=on
export RUSTC_WRAPPER="$CARGO_HOME/bin/sccache"
export RUST_BACKTRACE=1
export PKG_CONFIG_ALLOW_CROSS=1

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.autojump.zsh ] && source ~/.autojump.zsh

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval "$(goenv init -)"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
