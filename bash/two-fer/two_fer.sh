#!/usr/bin/env bash
# My bash coding style:
# https://github.com/meleu/exercism/tree/master/bash
#
# New concept:
# - `${var:-defaulValue}` means: 
#   "give me the value of ${var}, but if it's empty, give me 'defaultValue'"
#   https://mywiki.wooledge.org/BashGuide/Parameters#Parameter_Expansion

main() {
  local name="$1"

  echo "One for ${name:-you}, one for me."
}

main "$@"
