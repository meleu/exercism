#!/usr/bin/env bash

main() {
  local i
  local wordList=( "$@" )

  [[ "${#wordList[@]}" -eq 0 ]] && return 0

  for (( i = 1; i < ${#wordList[@]}; i++ )); do
    echo "For want of a ${wordList[$i-1]} the ${wordList[$i]} was lost."
  done
  echo "And all for the want of a ${wordList[0]}."

}

main "$@"
