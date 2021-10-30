#!/usr/bin/env bash

# My main inspiration for good bash coding style:
# https://github.com/progrium/bashstyle
#
# - All code goes in a function. Even if it's one function.
# - Always use `local` when setting variables.
# - Assign arguments to a variable with a meaningful name.
# - `${var:-defaulValue}` means: 
#   "give me the value of ${var}, but if it's empty, give me 'defaultValue'"

main() {
  local name="$1"

  echo "One for ${name:-you}, one for me."
}

main "$@"
