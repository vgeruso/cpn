#!/usr/bin/env bash
cd $CPN_DIR

VERSION=$(cpn -V)
PULL=$(git pull)


if test "$PULL" == "Already up to date."
then
  echo $PULL
  echo
  cpn -h
fi

if test "$PULL" != "Already up to date."
then
  sudo chmod 733 $CPN_DIR/src/uninstall.sh
  sudo chmod 733 $CPN_DIR/src/update.sh

  cd /usr/bin
  sudo rm cpn

  sudo cp $CPN_DIR/cpn.sh /usr/bin
  cd /usr/bin
  sudo mv cpn.sh cpn
  sudo chmod 777 cpn

  NEW_VERSION=$(cpn -V)

  if test "$VERSION" != "$NEW_VERSION"
  then
    echo "Update successfully!"
    echo
    cpn -h
  fi

  if test "$VERSION" == "$NEW_VERSION"
  then
    echo "==> No updated <=="
    echo
    cpn -h
  fi
fi
