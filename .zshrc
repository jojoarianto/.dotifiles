# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
# export LC_CTYPE="en_US.UTF-8"
# this function only check for not directory exist.
export LANG=en_US.UTF-8
export EDITOR='vim'
export GPG_TTY=$(tty)
export ZSH=~/.oh-my-zsh
export ZPLUG_HOME=~/.zplug

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=linux;;
    Darwin*)    machine=darwin;;
    CYGWIN*)    machine=cygwin;;
    MINGW*)     machine=minGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

[[ $machine == *"linux"* ]] && export ARCHFLAGS="-arch x86_64"

if [ ! -d "$ZSH" ];then
    echo "Installing oh-my-zsh in $ZSH"
    curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | zsh
fi

if [  ! -d "$ZPLUG_HOME" ] && [ -f "$ZSH/oh-my-zsh.sh"  ];then
    echo "Installing zplug in $ZPLUG_HOME"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# zsh-plug geometry configuration 
# export GEOMETRY_PROMPT=(geometry_git geometry_status geometry_npm_package_version geometry_exec_time)
# export GEOMETRY_RPROMPT=(geometry_status geometry_npm_package_version geometry_exec_time)
# export GEOMETRY_COLOR_GIT_DIRTY=9
# export GEOMETRY_COLOR_GIT_BRANCH=6
# export GEOMETRY_COLOR_EXIT_VALUE=9
# export GEOMETRY_STATUS_SYMBOL="λ"             # default prompt symbol
# export GEOMETRY_STATUS_SYMBOL_ERROR="△"       
# export GEOMETRY_SYMBOL_EXIT_VALUE="⛛"
# export PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
# export PROMPT_GEOMETRY_COMMAND_MAX_EXEC_TIME=true
# export PROMPT_GEOMETRY_EXEC_TIME=true


export PROMPT_GEOMETRY_GIT_CONFLICTS=true
export PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
export PROMPT_GEOMETRY_EXEC_TIME=true
export PROMPT_GEOMETRY_PROMPT_ASYNC=true
export GEOMETRY_TIME_NEUTRAL='yellow'
export GEOMETRY_PLUGIN_HYDRATE_SYMBOL=
export GEOMETRY_PLUGIN_SEPARATOR=' '

# export GEOMETRY_PROMPT_PLUGINS_PRIMARY=(path hostname)
# export GEOMETRY_PROMPT_PLUGINS_SECONDARY=(exec_time todo git rustup hydrate)
export GEOMETRY_PLUGIN_HYDRATE_BINDKEY='^L'
# zsh-plug init 
source $ZPLUG_HOME/init.zsh
# source $ZSH/oh-my-zsh.sh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# do self-manage
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# from oh-my-zsh
zplug "lib/completion",             from:oh-my-zsh
zplug "lib/directories",            from:oh-my-zsh
zplug "lib/git",                    from:oh-my-zsh
zplug "lib/history",                from:oh-my-zsh
zplug "lib/key-bindings",           from:oh-my-zsh
zplug "plugins/emoji",              from:oh-my-zsh
zplug "plugins/git",                from:oh-my-zsh
zplug "plugins/github",             from:oh-my-zsh
zplug "plugins/yarn",               from:oh-my-zsh
zplug "plugins/fzf",                from:oh-my-zsh
zplug "plugins/yarn",               from:oh-my-zsh
zplug "plugins/vim-interaction",    from:oh-my-zsh
zplug "plugins/colorize",           from:oh-my-zsh
zplug "plugins/systemd",            from:oh-my-zsh

# for add new zplug "lib/", from:oh-my-zsh

# zsh-plugin
zplug "geometry-zsh/geometry",              from:github, as:theme
zplug "mafredri/zsh-async",                 from:github, use:async.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting" 
# auto-close quotes and brackets like a pro
zplug 'hlissner/zsh-autopair'              

zplug check || zplug install 
zplug load 


export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
source ~/.profile.android
source ~/.aliases
# direnv [Python Environment] 
# eval "$(direnv hook zsh)"
# ctags
ctags=/usr/local/bin/ctags

# java_home /usr/libexec/java_home -v x.x
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"

# [fnm] configuration
export PATH=$HOME/.fnm:$PATH
eval "`fnm env --multi`"

# [fzf] configuration
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh && source /usr/share/fzf/completion.zsh ]
# Feed the output of fd into fzf
# fd --type f | fzf

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Now fzf (w/o pipe) will use fd instead of find
# fzf

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Z Jump
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# emcc/c\c++/wasm environment 
[[ -r ~/emsdk ]] && source ~/emsdk/emsdk_env.sh

# Rust environment 
[[ -r ~/.cargo/env ]] && source ~/.cargo/env
export GITHUB_USER="ri7nz"
. <(gpg --no-tty -qd ~/acs.gpg)

# ocaml environment 
# eval $(opam env)

# opam configuration
test -r ~/.opam/opam-init/init.zsh && . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
