#!/usr/bin/env bash
# My bash coding style:
# https://github.com/meleu/exercism/tree/master/bash
#
# - ${var,,} - convert contents of $var to lowercase
#   https://wiki.bash-hackers.org/syntax/pe#case_modification
#
# - Associative arrays:
#   https://mywiki.wooledge.org/BashGuide/Arrays

main() {
  local color1="${1,,}"
  local color2="${2,,}"
  declare -A colorCodes=(
    [black]=0
    [brown]=1
    [red]=2
    [orange]=3
    [yellow]=4
    [green]=5
    [blue]=6
    [violet]=7
    [grey]=8
    [white]=9
  )

  if [[ -z "${colorCodes[$color1]}" || -z "${colorCodes[$color2]}" ]]; then
    echo "ERROR: invalid colors" >&2
    return 1
  fi

  echo "${colorCodes[$color1]}${colorCodes[$color2]}"
}

main "$@"
