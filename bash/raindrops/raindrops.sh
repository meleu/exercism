#!/usr/bin/env bash

# My bash coding style:
# https://github.com/meleu/exercism/tree/master/bash
#
# Useful Concepts:
# - Associative arrays:
#   https://mywiki.wooledge.org/BashGuide/Arrays
#
# - Control Operators (&& and ||):
#   https://mywiki.wooledge.org/BashGuide/TestsAndConditionals#Control_Operators
#
# - `${var:-defaulValue}` means: 
#   "give me the value of ${var}, but if it's empty, give me 'defaultValue'"
#   https://mywiki.wooledge.org/BashGuide/Parameters#Parameter_Expansion

main() {
  local number="$1"
  local factor
  local output
  declare -A raindropName=(
    [3]='Pling'
    [5]='Plang'
    [7]='Plong'
  )

  # if not a number, abort
  [[ ${number} =~ ^[[:digit:]]+$ ]] || return 1

  for factor in 3 5 7; do
    [[ "$(( number % factor ))" -eq 0 ]] && output+="${raindropName[$factor]}"
  done

  echo "${output:-${number}}"
}

main "$@"
