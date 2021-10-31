#!/usr/bin/env bash
 
# Good bash coding style: https://github.com/progrium/bashstyle
# - All code goes in a function. Even if it's one function.
# - Always use `local` when setting variables.
# - Assign arguments to a variable with a meaningful name.
#
# New Concepts:
# - Testing with `[[ ]]` is preferred over `[ ]`:
#   https://google.github.io/styleguide/shellguide.html#s6.3-tests
#
# - `${var##*/}` expands to the contents of ${var} but removes everything
#   until the last slash '/'. Link:
#   https://mywiki.wooledge.org/BashGuide/Parameters#Parameter_Expansion

usage() {
  echo "Usage: ${0##*/} <person>"
}

main () {
  local name="$1"

  if [[ $# -ne 1 ]]; then
    usage
    return 1
  fi

  echo "Hello, ${name}"

}

main "$@"
