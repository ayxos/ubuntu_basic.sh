ubuntu_basic.sh
===============

init script for node/ubuntu users

A bash script to install all your essential basics on a fresh Ubuntu install.

First open the ```installs.sh``` file in a text editor, take a look at the array of apps, you can add or edit the list according to your needs.

Edit iptables as you wish

Once you're happy with what it's going to do, return to the console and make the file executable if it's not already.

```
    chmod +x installs.sh
```

Execute it!:

```
    ./installs.sh
```

# List of Programs
    1.vim
    2.git - (generate rsa_key if does not exist)
    3.htop
    4.curl
    5.gparted
    6.terminator
    7.nodejs - grunt
    8.zsh - Oh-my-zsh
    9.sublime-text (Also Package installer)
    10.mongodb

#Features
    - Oh-my-zsh aliases
    - sublime plugins
    - iptables
