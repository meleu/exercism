#!/usr/bin/env bash

pureBashSolution() {
  local char

  for char in {a..z}; do
    [[ ${inputLower} =~ ${char} ]] || return 1
  done
}


nonPureBashSolution() {
  local uniqueLettersAmount

  # get the amount of unique letters
  uniqueLettersAmount="$(grep -o '[a-z]' <<< "${inputLower}" | sort -u | wc -l)"

  [[ "${uniqueLettersAmount}" -eq 26 ]]
}


main() {
  local inputLower="${*,,}"

  pureBashSolution && echo true || echo false
  # nonPureBashSolution && echo true || echo false
}

main "$@"

