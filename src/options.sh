#!/usr/bin/env bash

if test $1 == "uninstall"
then
  bash $CPN_DIR/src/uninstall.sh
fi

if test $1 == "update"
then
  bash $CPN_DIR/src/update.sh
fi
