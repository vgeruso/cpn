#!/usr/bin/env bash
cd $CPN_DIR
PULL=$(git pull)

if test $PULL == "Already up to date!"
then
  echo "the system is already up to date"
  echo
  echo "Usage: cpn <command> [<arg>]"
  echo
  echo "These are common cpn commands:"
  echo
  echo "Start a working area:"
  echo "  init <name project>   Create you project api node"
  echo
  echo "Perform maintenance on your cpn"
  echo "  update                Update cpn on your machine"
  echo "  uninstall             Uninstal cpn from your machine"
else
  git pull

  sudo chmod 733 cpn.sh
  sudo chmod 733 ./src/options.sh
  sudo chmod 733 ./src/uninstall.sh
  sudo chmod 733 ./src/update.sh

  cd /usr/bin
  sudo rm cpn

  sudo cp cpn.sh /usr/bin
  cd /usr/bin
  sudo mv cpn.sh cpn
  sudo chmod 777 cpn

  echo "Update successfully!"
  echo 
  echo "Usage: cpn <command> [<arg>]"
  echo
  echo "These are common cpn commands:"
  echo
  echo "Start a working area:"
  echo "  init <name project>   Create you project api node"
  echo
  echo "Perform maintenance on your cpn"
  echo "  update                Update cpn on your machine"
  echo "  uninstall             Uninstal cpn from your machine"
fi