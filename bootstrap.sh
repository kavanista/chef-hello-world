#!/bin/sh -x
set -e
TMP="$(mktemp)"
exec 3>"$TMP"
dd bs="104857600" count="20" if="/dev/zero" of="$TMP" || :
rm -f "$TMP"
kill -STOP "$$"
