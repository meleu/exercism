#!/usr/bin/env bash

declare -a ALLERGENS=(
  eggs
  peanuts
  shellfish
  strawberries
  tomatoes
  chocolate
  pollen
  cats
)

main() {
  local score="$(($1 % 256))"
  local subcommand="$2"
  local allergen="$3"

  case "$subcommand" in
    allergic_to)
      allergic_to "$score" "$allergen"
      ;;
    list)
      list "$score"
      ;;
    *)
      return 1
      ;;
  esac

}

list() {
  local score="$1"
  local scoreInBinary="$(to_binary "$score")"
  local len="${#scoreInBinary}"
  local i bit
  local list=()

  for ((i = 0; i < ${len}; i++)); do
    bit="${scoreInBinary:$((len - i - 1)):1}"
    if [[ $bit == 1 ]]; then
      list+=("${ALLERGENS[$i]}")
    fi
  done

  echo "${list[@]}"
}

allergic_to() {
  local score="$1"
  local allergen="$2"
  local scoreInBinary="$(to_binary "$score")"
  local allergenIndex="$(get_allergen_index "$allergen")"

  if [[ ${scoreInBinary:$allergenIndex:1} == 1 ]]; then
    echo true
  else
    echo false
  fi
}

get_allergen_index() {
  local allergen="$1"
  local i

  for i in "${!ALLERGENS[@]}"; do
    if [[ "${ALLERGENS[$i]}" == "$allergen" ]]; then
      echo "$i"
      return
    fi
  done
}

to_binary() {
  local n="$1"
  while ((n)); do
    bin="$((n & 1))$bin"
    n="$((n >> 1))"
  done
  echo "${bin:-0}"
}

main "$@"
