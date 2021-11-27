#!/usr/bin/env bash
# My bash coding style:
# https://github.com/meleu/exercism/tree/master/bash
#
# Concepts:
#
# - Good practice: "Enigmatic" code should go in a
#   function with a meaningful name.
#
# - Reduced equation of the circumference:
#   https://www.sangakoo.com/en/unit/equation-of-the-circumference-i-reduced-equation
#
# - Here-Strings:
#   https://mywiki.wooledge.org/BashGuide/InputAndOutput#Heredocs_And_Herestrings
#
# - Using the bc calculator:
#   https://www.tecmint.com/bc-command-examples/

usage() {
  echo "Usage: ${0##*/} <x> <y>"
}

validateInput() {
  local regexRealNumber='^-?[[:digit:]\.]+$'

  if [[ 
    -z "${y}" 
    || -z "${x}"
    || ! ${x} =~ ${regexRealNumber}
    || ! ${y} =~ ${regexRealNumber}
  ]]; then
    usage >&2
    return 1
  fi
}

compareRealNumber() {
  [[ $(bc <<< "$@") -eq 1 ]]
}

getDistanceFromCenter() {
  bc <<< "scale=2; sqrt($1 ^ 2 + $2 ^ 2)"
}

main() {
  local x="$1"
  local y="$2"
  local distanceFromCenter
  local points

  validateInput || return 1

  distanceFromCenter="$(getDistanceFromCenter "${x}" "${y}")"

  if compareRealNumber "${distanceFromCenter} <= 1"; then
    points=10
  elif compareRealNumber "${distanceFromCenter} <= 5"; then
    points=5
  elif compareRealNumber "${distanceFromCenter} <= 10"; then
    points=1
  else
    points=0
  fi

  echo "${points}"
}

main "$@"
