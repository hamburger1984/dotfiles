#!/bin/bash
#
#   This file echoes a bunch of color codes to the
#   terminal to demonstrate what's available.  Each
#   line is the color code of one forground color,
#   out of 17 (default + 16 escapes), followed by a
#   test use of that color on all nine background
#   colors (default + 8 escapes).
#

function hr {
  local start=$'\e(0' end=$'\e(B' line='qqqqqqqqqqqqqqqq'
  local cols=${COLUMNS:-$(tput cols)}
  while ((${#line} < cols)); do line+="$line"; done
  tput setaf 240; printf '%s%s%s\n' "$start" "${line:0:cols}" "$end"; tput sgr0
}

T='▆ ▆'   # The test text

echo -e "\n                 40m     41m     42m     43m\
     44m     45m     46m     47m";

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
  done
  echo;
done
echo
hr

# --- termcap stuff
for C in {0..255}; do
    tput setab $C
    echo -n "$C "
done
tput sgr0
echo
hr

# --- ansi escapes
# standard colors
for C in {40..47}; do
    echo -en "\e[${C}m$C "
done
echo -e "\e(B\e[m"
# high intensity colors
for C in {100..107}; do
    echo -en "\e[${C}m$C "
done
echo -e "\e(B\e[m"
# 256 colors
for C in {16..255}; do
    echo -en "\e[48;5;${C}m$C "
done
echo -e "\e(B\e[m"
hr
