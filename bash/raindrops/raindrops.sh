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
  [[ ${number} =~ ^[0-9]+$ ]] || return 1

  for factor in 3 5 7; do
    [[ "$(( number % factor ))" -eq 0 ]] && output+="${raindropName[$factor]}"
  done

  [[ -z "${output}" ]] && output="${number}"

  echo "${output}"
}

main "$@"
