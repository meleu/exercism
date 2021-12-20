#!/usr/bin/env bash

readonly regexValidDirection='^(north|west|south|east)$'


turnLeft() {
  case "${direction}" in
    north) echo "west" ;;
    west ) echo "south" ;;
    south) echo "east" ;;
    east ) echo "north" ;;
  esac
}


turnRight() {
  case "${direction}" in
    north) echo "east" ;;
    west ) echo "north" ;;
    south) echo "west" ;;
    east ) echo "south" ;;
  esac
}


advance() {
  case "${direction}" in
    north) (( y++ )) ;;
    west ) (( x-- )) ;;
    south) (( y-- ));;
    east ) (( x++ ));;
    *) return 1
  esac
}


main() {
  local x="${1:-0}"
  local y="${2:-0}"
  local direction="${3:-north}"
  local instructions="$4"
  local instruction
  local i

  if ! [[ $direction =~ $regexValidDirection ]]; then
    echo "invalid direction" >&2
    return 1
  fi

  for ((i=0; i < ${#instructions}; i++)); do
    instruction="${instructions:$i:1}"
    case "${instruction}" in
      R) direction="$(turnRight)" ;;
      L) direction="$(turnLeft)" ;;
      A) advance ;;
      *) echo "invalid instruction" >&2; return 1 ;;
    esac
  done

  echo "${x} ${y} ${direction}"
}

main "$@"