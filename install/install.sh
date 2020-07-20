#!/bin/bash

ask_yes_no()
{
    printf "[?] %s\n" "${1}"
    printf "You sure? [y/N]: "; read a
    if [ "${a}" == "Y" ] || [ "${a}" == "y" ]; then
        return 0
    else
        return 1
    fi
}

install()
{
    [ -d ~/.vim ] &&
        ask_yes_no "about to remove old ~/.vim" && rm -rf ~/.vim

    cp -R ../vim ~/.vim
    res_vim=${?}

    if [ "${res_vim}" == "0" ]; then
        printf "[+] Installed for user: %s\n\n" "${USER}"
    else
        printf "[-] Err installing vim for user: %s\n\n" "${USER}"
    fi
}

# install for user
install

# install for root as well?
if ask_yes_no "do you want to install it for root?"; then
    sudo bash -c "$(declare -f install; declare -f ask_yes_no); install"
fi

pip install -r install/requirements.txt --user

#eof
