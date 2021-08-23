#!/usr/bin/env bash
if test $1
then
  bash $CPN_DIR/src/options.sh $1 $2
else
  echo "cpn version 1.2.0"
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
