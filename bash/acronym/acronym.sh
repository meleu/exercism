#!/usr/bin/env bash

# Concepts used in this solution:
#
# - ${var//pattern/replace} - to expand a variable replacing the pattern.
#   link: https://wiki.bash-hackers.org/syntax/pe#search_and_replace
#   note: pattern can be a regex in bash
#
# - ${var^} puts the first char of $var in upper case.
#   link: https://wiki.bash-hackers.org/syntax/pe#case_modification
#
# - ${string:0:1} - gets only the first char in ${string}
#   link: https://wiki.bash-hackers.org/syntax/pe#substring_expansion
#
# - regex good practice: always use regex in a variable with a meaningful name.

# regex to filter out every non-letter (ASCII only) plus 'single quote'
readonly regexFilter="[^a-zA-Z\']"

main() {
  local input=()
  local string
  local acronym

  # https://github.com/koalaman/shellcheck/wiki/SC2206
  IFS=' ' read -ra input <<< "${@//${regexFilter}/ }"

  # ${var^} puts the first char of $var in upper case
  for string in "${input[@]^}"; do
    acronym+="${string:0:1}"
  done

  echo "${acronym}"
}

main "$@"
