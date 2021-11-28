#!/usr/bin/env bash


lastChar() {
  local string="$*"
  echo "${string: -1}"
}

popChar() {
  local string="$*"
  local length="${#string}"

  echo "${string:0:${length} - 1}"
}

matchingBrackets() {
  local input="$1"
  local i
  local char
  local stack

  # go through all characters of ${input}
  for (( i = 0; i < ${#input}; i++ )); do
    char="${input:$i:1}"

    # if an opening bracket is found, stack it
    case "${char}" in
      '['|'{'|'(')
        stack+="${char}"
        ;;
      ']')
        # check if it's correctly nested
        [[ "$(lastChar "${stack}")" != '[' ]] && return 1

        # closing correctly, then remove the opening bracket from the stack
        stack="$(popChar "${stack}")"
        ;;
      '}')
        [[ "$(lastChar "${stack}")" != '{' ]] && return 1
        stack="$(popChar "${stack}")"
        ;;
      ')')
        [[ "$(lastChar "${stack}")" != '(' ]] && return 1
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
