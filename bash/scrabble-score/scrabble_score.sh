#!/usr/bin/env bash
# My bash coding style:
# https://github.com/meleu/exercism/tree/master/bash
#
# - ${var,,} - convert contents of $var to lowercase
#   https://wiki.bash-hackers.org/syntax/pe#case_modification
#
# - Associative arrays:
#   https://mywiki.wooledge.org/BashGuide/Arrays
#
# - Parameter Expansion: `${var//pattern/replace}`
#   https://mywiki.wooledge.org/BashGuide/Parameters#Parameter_Expansion
#
# - Arithmetic Evaluation: e.g.: `(( var += i * number))`
#   https://mywiki.wooledge.org/BashGuide/CompoundCommands#Arithmetic_Evaluation

main() {
  local inputLower="${*,,}"
  local inputFiltered
  local points
  declare -A filterOutArray=(
    [1]='[^aeioulnrst]'
    [2]='[^dg]'
    [3]='[^bcmp]'
    [4]='[^fhvwy]'
    [5]='[^k]'
    [8]='[^jx]'
    [10]='[^qz]'
  )

  for i in "${!filterOutArray[@]}"; do
    inputFiltered="${inputLower//${filterOutArray[$i]}/}"
    (( points += i * "${#inputFiltered}" ))
  done

  echo "${points}"
}

main "$@"

