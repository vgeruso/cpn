#!/usr/bin/env bash
cd $CPN_DIR

PULL=$(git pull)
VERSION=$(cpn -v)

if test "$PULL" == "Already up to date."
then
  echo $PULL
  echo
  bash $CPN_DIR/src/help.sh
fi

if test "$PULL" != "Already up to date."
then
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

  if test "$VERSION" != "$NEW_VERSION"
  then
    echo "Update successfully!"
    echo
    bash $CPN_DIR/src/help.sh
  fi

  if test "$VERSION" == "$NEW_VERSION"
  then
    echo "==> No updated <=="
    echo
    bash $CPN_DIR/src/help.sh
  fi
fi
