#!/usr/bin/env bash

encode() {
  local encoded

  encoded="$(
    tr \
      abcdefghijklmnopqrstuvwxyz \
      zyxwvutsrqponmlkjihgfedcba \
      <<< "${inputFiltered}" \
      | fold -sw 5
  )"

  echo "${encoded//$'\n'/ }"
}

decode() {
  tr \
    zyxwvutsrqponmlkjihgfedcba \
    abcdefghijklmnopqrstuvwxyz \
    <<< "${inputFiltered}"
}

main() {
  local operation="$1"
  shift
  local input="${*,,}"
  local inputFiltered="${input//[ [:punct:]]/}"

  ${operation}
}

main "$@"

