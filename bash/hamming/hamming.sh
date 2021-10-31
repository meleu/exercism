#!/usr/bin/env bash

# My bash coding style:
# https://github.com/meleu/exercism/tree/master/bash
#

usage() {
  echo "Usage: ${0##*/} <string1> <string2>" >&2
}

main() {
  local dna1="$1"
  local dna2="$2"
  local distance='0'
  local i

  if [[ $# -ne 2 ]]; then
    usage
    return 1
  fi

  if [[ "${#dna1}" -ne "${#dna2}" ]]; then
    echo "Error: strands must be of equal length" >&2
    return 1
  fi

  if [[ "${dna1}" == "${dna2}" ]]; then
    echo 0
    return
  fi

  for i in $(seq 0 ${#dna1}); do
    [[ "${dna1:$i:1}" != "${dna2:$i:1}" ]] && (( distance++ ))
  done

  echo "${distance}"
}

main "$@"
