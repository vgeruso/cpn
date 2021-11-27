#!/usr/bin/env bash
git clone https://github.com/vgeruso/cpn.git .cpn/

cd .cpn

sudo chmod 733 cpn.sh
sudo chomd 733 ./src/init.sh
sudo chmod 733 ./src/options.sh
sudo chmod 733 ./src/uninstall.sh
sudo chmod 733 ./src/update.sh

sudo cp cpn.sh /usr/bin
cd /usr/bin
sudo mv cpn.sh cpn
sudo chmod 777 cpn

cd ~/

if test $HOME/.bash_profile
then
  echo -e '#cpn' >> .bash_profile
  echo -e 'export CPN_DIR="${HOME}/.cpn"' >> .bash_profile
fi

if test $HOME/.zshrc
then
  echo -e '#cpn' >> .zshrc
  echo -e 'export CPN_DIR="${HOME}/.cpn"' >> .zshrc
fi

if test $HOME/.profile
then
  echo -e '#cpn' >> .profile
  echo -e 'export CPN_DIR="${HOME}/.cpn"' >> .profile
fi

if test $HOME/.bashrc
then
  echo -e '#cpn' >> .bashrc
  echo -e 'export CPN_DIR="${HOME}/.cpn"' >> .bashrc
fi

echo
$CPN_DIR/src/help.sh

rm install.sh
