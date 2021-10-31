#!/usr/bin/env bash
# 
# This exercise is much simpler if you know how to handle bitwise operations.
# The thing is: Although supported, bitwise operations are not really something
# people handle using bash. Therefore they're better documented in material
# about the C programming language. e.g.:
# https://www.tutorialspoint.com/cprogramming/c_bitwise_operators.htm
#
# ---
#
# My bash coding style:
# https://github.com/meleu/exercism/tree/master/bash
#
# - Arithmetic Evaluation (used to handle bitwise operations here)
#   https://mywiki.wooledge.org/BashGuide/CompoundCommands#Arithmetic_Evaluation
#
# - (( number >> n & 1 )) means: shift the bits of $number to left $n times and
#   return the value of the bit at right (aka Least Significant Bit).
#   In other words: "give me the value of the (n+1)th bit".
#
# - joining elements of an array with a character:
#   https://dev.to/meleu/how-to-join-array-elements-in-a-bash-script-303a

joinBy() {
  local IFS="$1"
  shift
  echo "$*"
}

main() {
  local number="$1"
  local handshake=()
  local isReverse
  local moves=(
    'wink'
    'double blink'
    'close your eyes'
    'jump'
  )

  # getting the value of the 5th bit
  (( isReverse = number >> 4 & 1 ))

  for i in "${!moves[@]}"; do
    # getting the value of the ith bit
    if [[ $(( number >> i & 1 )) -eq 1 ]]; then
      if [[ "${isReverse}" -eq 1 ]]; then
        handshake=( "${moves[$i]}" "${handshake[@]}" )
      else
        handshake=( "${handshake[@]}" "${moves[$i]}" )
      fi
    fi
  done

  joinBy ',' "${handshake[@]}"
}

main "$@"
