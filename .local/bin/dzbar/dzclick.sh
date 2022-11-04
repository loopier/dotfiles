#!/usr/bin/env bash
set -euo pipefail

ONE=$(echo "a")
TWO=$(echo "b" | dzen2 -y 40)
# foo ^ca(1, $TWO)^fg(red)click me^fg()^ca() bar | dzen2
cat ~/.config/dzen2.conf | dzen2
