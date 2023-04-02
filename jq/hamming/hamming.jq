if (.strand1 | length) != (.strand2 | length) then
  "strands must be of equal length"
  | halt_error
else
  [(.strand1 / ""), (.strand2 / "")]
  | transpose
  | map(select(.[0] != .[1]))
  | length
end
