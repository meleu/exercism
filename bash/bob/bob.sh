#!/usr/bin/env bash

isSilence() {
  [[ ${input} =~ ^[[:space:]]*$ ]]
}

isQuestion() {
  [[ ${input} =~ \?\ *$ ]]
}

isYelling() {
  [[ ${input} =~ ^[^[:lower:]]+$ && ${input} =~ [[:upper:]] ]]
}

main() {
  local input="$*"
  local answer

  if isSilence; then
    answer='Fine. Be that way!'
  elif isYelling && isQuestion; then
    answer="Calm down, I know what I'm doing!"
  elif isYelling; then
    answer='Whoa, chill out!'
  elif isQuestion; then
    answer='Sure.'
  else
    answer='Whatever.'
  fi

  echo "${answer}"
}

main "$@"
