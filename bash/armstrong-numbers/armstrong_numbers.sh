#!/usr/bin/env bash

main() {
  local number="$1"
  local digitsAmount="${#number}"
  local result
  local i

  [[ ${number} =~ ^[[:digit:]]+$ ]] || return 1

  for (( i=0; i < digitsAmount; i++ )); do
    result="$(( result + ${number:$i:1} ** digitsAmount ))"
  done

  [[ ${result} -eq ${number} ]] && echo true || echo false
}

main "$@"
