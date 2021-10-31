#!/usr/bin/env bash

# Concepts used in this solution:


usage() {
  echo "Usage: ${0##*/} <year>"
}

evenlyDivisibleBy() {
  local dividend="$1"
  local divisor="$2"

  [[ $(( dividend % divisor )) -eq 0 ]]
}

isLeapYear() {
  local year="$1"

  evenlyDivisibleBy "${year}" 400 \
    || ( 
      evenlyDivisibleBy "${year}" 4 \
      && ! evenlyDivisibleBy "${year}" 100
    )
}

isValidInput() {
  [[ "$#" -eq 1 && ${input} =~ ^[[:digit:]]+$ ]]
}

main() {
  local input="$1"
  local output='false'

  if ! isValidInput "$@"; then
    usage
    return 1
  fi

  isLeapYear "${input}" && output='true'

  echo "${output}"
}

main "$@"

