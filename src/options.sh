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
  # bash $CPN_DIR/src/update.sh
  echo "Update => $1 => In development"
fi

if test $1 == "-h"
then
  bash $CPN_DIR/src/help.sh
fi

if test $1 == "--help"
then
  bash $CPN_DIR/src/help.sh
fi