# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

files=(
    ~/.aliases
    ~/.bash_prompt
    ~/.curlrc
    ~/.exports
    ~/.functions
    ~/.gitconfig
    ~/.screenrc
    ~/.vimrc
    ~/.wgetrc
)
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        # shellcheck disable=SC1090
        source "$file"
    fi
done

options=(
    histappend
    cdspell
    globstar
    dotglob
    cmdhist
    dirspell
    nocaseglob
)

for option in "${options[@]}"; do
    shopt -s "$option"
done


# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
