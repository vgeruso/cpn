#!/usr/bin/env bash
if test $1 == "init"
then
  bash $CPN_DIR/src/init.sh $2
fi

if test $1 == "uninstall"
then
  bash $CPN_DIR/src/uninstall.sh
fi

if test $1 == "update"
then
  bash $CPN_DIR/src/update.sh
  # echo "Update => $1 => In development"
else
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