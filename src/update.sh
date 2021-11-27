#!/usr/bin/env bash
cd $CPN_DIR
PULL=$(git pull)

if test $PULL == "Already up to date!"
then
  echo "the system is already up to date"
  echo
else
  git pull

  sudo chmod 733 ../cpn.sh
  sudo chomd 733 ./src/init.sh
  sudo chmod 733 ./src/options.sh
  sudo chmod 733 ./src/uninstall.sh
  sudo chmod 733 ./src/update.sh

  cd /usr/bin
  sudo rm cpn

  sudo cp ../cpn.sh /usr/bin
  cd /usr/bin
  sudo mv cpn.sh cpn
  sudo chmod 777 cpn

  echo "Update successfully!"
  echo
  $CPN_DIR/src/help.sh
fi