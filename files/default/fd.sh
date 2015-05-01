#!/bin/sh -x

set -e

PROC="named"
PID=$(pgrep $PROC)

if [ "$PID" ]; then
  DELETED=$(lsof -p $PID | grep '(deleted)' | grep 'w' | awk -F ' ' '{print $4}' | sed 's/w//g')
  for fd in $DELETED; do
    case "$fd" in
      0|1|2)
        ;;
      *)
        eval "exec >/proc/$PID/fd/$fd"
        ;;
    esac
  done
fi
