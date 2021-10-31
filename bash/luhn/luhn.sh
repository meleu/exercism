#!/usr/bin/env bash

main() {
  local input="${*// /}"        # spaces should be stripped
  local length="${#input}"
  local i
  local checksum
  local digit
  local tempNumber

  if [[
    "${length}" -le 1           # strings of length 1 or less are not valid
    || ${input} =~ [^[:digit:]] # non-digit characters are disallowed
  ]]; then
    echo false
    return 0
  fi

  for (( i = length - 1; i >= 0; i-- )); do
    digit="${input:$i:1}"

    # double every second digit, starting from the right
    if [[ $(( (length - i) % 2 )) -eq 0 ]]; then
      tempNumber="$(( digit * 2))"

      # if doubling the number results in a number greater than 9...
      if [[ "${tempNumber}" -gt 9 ]]; then
        (( checksum += tempNumber - 9 ))  # subtract 9 from the product
      else
        (( checksum += tempNumber ))
      fi

    else
      (( checksum += digit ))
    fi
  done

  # if the sum is evenly divisible by 10, then the number is valid
  [[ "$(( checksum % 10 ))" -eq 0 ]] && echo true || echo false
}

main "$@"

