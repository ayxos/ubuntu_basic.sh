#!/bin/bash

# Array of applications to be installed
apps=(

vim
git
htop
curl
gparted
terminator
zsh

)

# Array of sublime plugins
sublimeplugs=(

git://github.com/SublimeCodeIntel/SublimeCodeIntel.git
https://github.com/facelessuser/BracketHighlighter.git

)

#update repos
sudo apt-get update

if [ ! -d ~/.npm/ ]; then
  #test if already exist
  echo "node is not installed"
  sudo add-apt-repository ppa:chris-lea/node.js
  sudo apt-get update
  # Control will enter here if $DIRECTORY doesn't exist.
  sudo apt-get install python-software-properties python g++ make
  sudo apt-get install nodejs
  #install npm grunt global cli
  sudo npm install -g grunt-cli
else
  echo "node is already installed"
fi

# Loop over apps and install each one with default 'yes' flag
for app in "${apps[@]}"
do
  sudo apt-get install $app -y
done

#install oh-my-zsh
if [ ! -d ~/.oh-my-zsh/ ]; then
  #test if already exist
  echo "oh-my-zsh is not installed"
  wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
  #set oh-my-zsh as default
  chsh -s /bin/zsh
else
  echo "oh-my-zsh is already installed"
fi


#generate a rsa-ssh key if not exist
if [ ! -d ~/.ssh/id_rsa.pub ]; then
  echo "generating id_rsa"
  ssh-keygen
  cat ~/.ssh/id_rsa.pub
else
  echo "id_rsa already exist"
  cat ~/.ssh/id_rsa.pub
fi


#install sublime-text if not exist
if [ ! -d ~/.config/sublime-text* ]; then
  #test if already exist
  echo "sublime is not installed"
  sudo add-apt-repository ppa:webupd8team/sublime-text-2
  sudo apt-get update
  sudo apt-get install sublime-text
  echo "alias sbl=\"sublime-text &\"" >> ~/.zshrc
else
  echo "sublime is already installed"
fi

#install sublime package-installer
if [ -d ~/.config/sublime-text* ]; then
  #test if already exist
  wget https://sublime.wbond.net/Package%20Control.sublime-package
  mv *.sublime-package ~/.config/sublime-text-2/Installed\ Packages
  #for plug in "${sublimeplugs[@]}"
  #do
#	git clone $plug sublime
  #done
fi

sudo npm install -g grunt-cli
sudo apt-get install mongodb

#aplying iptables
sudo iptables-restore < iptables.rules

sudo apt-get autoremove
sudo apt-get clean

# Set git credentials
#git config --global user.name "YOUR NAME"
#git config --global user.email YOU@YOUREMAIL.com
#git config --global credential.helper cache

#alias git for zsh
echo "importing zsh aliases"
echo "#git alias" >> ~/.zshrc
echo "alias gst=\"git status\"" >> ~/.zshrc
echo "alias gcm=\"git commit -am\"" >> ~/.zshrc
echo "alias gup=\"git pull --all\"" >> ~/.zshrc
echo "alias gps=\"git push\"" >> ~/.zshrc

echo "#end alias" >> ~/.zshrc
#echo "alias your_server=\"ssh your_domain_user@your_server_domain.com\"" >> ~/.zshrc
