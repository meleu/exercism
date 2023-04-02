# Note, the expressions for the first three tasks must end with commas.
#
# Recall that a jq program is a *single expression*. For this exercise,
# you are solving four separate tasks with one source file. Use the
# comma operator so the outputs of these filters are joined into a
# single output stream. jq prints each item in a data stream on a
# separate line, which makes the tests easier to write.
#
# This is an error:
#     jq -n '
#       1
#       2
#       3
#     '
#  
# With commas, it is OK:
#     jq -n '
#       1,
#       2,
#       3
#     '
# 
# You'll need to use parenthses to control order of operations

# Task 1: replace `null` with the "name" element of the shopping list.
.name,

# Task 2: replace `null` with the count of the required ingredients.
(.ingredients | length),

# Task 3: replace `null` with the amount of sugar.
#(.ingredients[1].amount.quantity),
(.ingredients[] | select(.item == "sugar").amount.quantity),

# Task 4: replace `null` with the mapping of ingredient names with their substitutions
# (no comma after the last filter)
(
  [
    .ingredients + ."optional ingredients" # concatenate arrays
    | .[]                       # extract elements from the array
    | select(has("substitute")) # select only elements with "substitute"
    | {(.item): .substitute}    # create new objects
  ]                             # put the objects in an array
  | add                         # convert the array into an object
)
