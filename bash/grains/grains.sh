#!/usr/bin/env bash

# inspiration:
# https://github.com/dylanaraps/pure-bash-bible#loop-over-a-range-of-numbers
buildExpression() {
  local i
  local expression='1'

  for i in {1..63}; do
    expression+="+2^${i}"
  done

  echo "${expression}"
}

main() {
  local position="$1"
  local result

  if [[
    "${position}" != 'total'
    && "${position}" -lt 1
    || "${position}" -gt 64
  ]]; then
    echo "Error: invalid input" >&2
    return 1
  fi

  if [[ "${position}" == 'total' ]]; then
    # inspiration for the seq strategy:
    # https://stackoverflow.com/a/3394758/6354514
    #result="$(echo "1+$(seq -s '+2^' 1 63)" | bc)"

    # pure-bash solution
    result="$(buildExpression | bc)"
  else
    result="$(( 2 ** (position - 1) ))"
  fi

  printf '%u' "${result}"
}

main "$@"

