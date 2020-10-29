#!/bin/sh

# RWP*Load Simulator
#
# Copyright (c) 2020 Oracle Corportaion
# Licensed under the Universal Permissive License v 1.0
# as shown at https://oss.oracle.com/licenses/upl/

# Display an rwloadsim man page
#
# History
#
# bengsig  16-sep-2020  Add -s 1rwl option to call to man
# bengsig  11-sep-2020  Creation

# our man pages are in rwl/man/man1rwl, make a proper
# manpath to find them

if test $0 = rwlman
then
  # Called via PATH, see where we were found
  for dir in `echo $PATH | sed 's/:/ /g'`
  do
    if test -x "$dir"/rwlman
    then
      manpath=$dir/../rwl/man
      break;
    fi
  done
else
  manpath=`echo $0 | sed 's%/rwlman$%/../rwl/man%'`
fi

# echo $manpath
if test $# = 0
then
  exec man -s 1rwl -M $manpath rwlman
else
  exec man -s 1rwl -M $manpath "$@"
fi
