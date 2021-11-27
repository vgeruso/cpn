#!/usr/bin/env bash
cd $CPN_DIR

PULL=$(git pull)
VERSION=$(cpn -v)

if test $PULL == "Already up to date!"
then
  echo "the system is already up to date"
  echo
else
  git pull

  sudo chmod 733 cpn.sh
  sudo chmod 733 ./src/init.sh
  sudo chmod 733 ./src/options.sh
  sudo chmod 733 ./src/uninstall.sh
  sudo chmod 733 ./src/update.sh
  sudo chmod 733 ./src/help.sh
  sudo chmod 733 ./src/version.sh

  cd /usr/bin
  sudo rm cpn

  sudo cp $CPN_DIR/cpn.sh /usr/bin
  cd /usr/bin
  sudo mv cpn.sh cpn
  sudo chmod 777 cpn

  NEW_VERSION=$(cpn -v)

  if test $VERSION != $NEW_VERSION
    echo "Update successfully!"
    echo
  else
    echo "Update error contact support"
    echo
  fi

  bash $CPN_DIR/src/help.sh
fi