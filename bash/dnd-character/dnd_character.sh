#!/usr/bin/env bash
# My bash coding style:
# https://github.com/meleu/exercism/tree/master/bash
#
# Concepts:
# - Associative arrays:
#   https://mywiki.wooledge.org/BashGuide/Arrays
#
# - ${!array[@]} - expands to all keys used in that array.
#
# - command <<< string - Here-Strings:
#   https://mywiki.wooledge.org/BashGuide/InputAndOutput#Heredocs_And_Herestrings
#
# - Using the bc calculator:
#   https://www.tecmint.com/bc-command-examples/
#
# - That "enigmatic" bc function used to "round down" was taken from:
#   http://phodd.net/gnu-bc/code/funcs.bc
#
# - joining elements of an array with a character:
#   https://dev.to/meleu/how-to-join-array-elements-in-a-bash-script-303a

generate() {
  local ability
  local hitpoints
  declare -A abilities=(
    [strength]=''
    [dexterity]=''
    [constitution]=''
    [intelligence]=''
    [wisdom]=''
    [charisma]=''
  )

  for ability in "${!abilities[@]}"; do
    abilities[$ability]="$(getAbilityValue)"
    echo "${ability} ${abilities[$ability]}"
  done

  hitpoints="$(( 10 + $(modifier "${abilities[constitution]}") ))"
  echo "hitpoints ${hitpoints}"
}

modifier() {
  local constitution="$1"
  local expression="(${constitution} - 10) / 2"

  # inspiration for the bc round down function:
  # http://phodd.net/gnu-bc/code/funcs.bc
  local bcFunctionRoundDown='
  define floor(x) {
    auto xx
    scale=0
    xx=x/1
    if(xx>x).=xx--
    return(xx)
  }'

  bc <<< "${bcFunctionRoundDown}; scale=1; floor($expression)"
}

joinBy() {
  local IFS="$1"
  shift
  echo "$*"
}

getAbilityValue() {
  local values=()
  local currentValue
  local i
  local leastIndex='0'

  for (( i = 0; i < 4; i++ )); do
    currentValue="$(rollDice)"
    values+=( "${currentValue}" )
    [[ "${currentValue}" -lt "${values[$leastIndex]}" ]] && leastIndex="${i}"
  done

  # discard the least value
  unset "values[$leastIndex]"

  echo "$(( "$(joinBy '+' "${values[@]}")" ))"
}

rollDice() {
  echo "$(( RANDOM % 6 + 1))"
}

"$@"
