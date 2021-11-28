#!/usr/bin/env bash


lastChar() {
  local string="$*"
  echo "${string: -1}"
}

popChar() {
  echo "${*%?}"
}

matchingBrackets() {
  local input="$1"
  local i
  local char
  local stack
  declare -A bracketPairs=(
    [']']='['
    ['}']='{'
    [')']='('
  )

  # go through all characters of ${input}
  for (( i = 0; i < ${#input}; i++ )); do
    char="${input:$i:1}"

    case "${char}" in
      '[' | '{' | '(')
        # if an opening bracket is found, stack it
        stack+="${char}"
        ;;
      ']' | '}' | ')')
        # check if it's correctly nested
        [[ "$(lastChar "${stack}")" != "${bracketPairs[$char]}" ]] && return 1

        # it's closing correctly, therefore remove the
        # opening bracket from the stack
        stack="$(popChar "${stack}")"
        ;;
    esac
  done

  # an empty stack means that all brackets were "closed"
  [[ -z "${stack}" ]]
}

main() {
  matchingBrackets "$@" && echo true || echo false
}

main "$@"
