#!/usr/bin/env bash
if test $1
then
  bash $CPN_DIR/src/options.sh $1 $2
else
  bash $CPN_DIR/src/help.sh
fi
