# Learning jq

I'm using the exercism.org challenges to learn jq.

In this file I'm taking notes about the interesting things I'm learning on each exercise.

**Note**: I'm enjoying using [ijq](https://github.com/gpanders/ijq)
to have a jqplay like experinece at the command line.

---

## shopping

- [shopping](shopping)

The last exercise was challenging for me...

[Here's the json file](shopping/shopping-list.json).

> ### 4. Map the ingredients which can be substituted
> 
> Some of the ingredients can be substituted (if you don't have ingredient X you can use Y).
> Output a JSON object mapping the recommended ingredient to its substitution.
> Include the optional ingredients in the mapping.

I had to appeal to the [HINTS](shopping/HINTS.md)

> - You need to concatenate two arrays.
> - You need to select specific elements from the resulting array.
> - You need to generate a key:value object for each of these elements.
> - You need to merge these objects into a single object.

Applying those hints

```jq
# NOTE: the comments below are messing the code.
# They're kept here for educational purposes.
[
  .ingredients + ."optional ingredients" # concatenate arrays
  | .[]                       # extract elements from the array
  | select(has("substitute")) # select only elements with "substitute"
  | {(.item): .substitute}    # create new objects
]                             # put the objects in an array
| add                         # convert the array into an object
```

### has()

From the docs:

> The builtin function has returns whether the input object has the given key,
> or the input array has an element at the given index.


### add

The `add` function acts just like the `+` operator. This is the description
in the documentation:

> Objects are added by merging, that is, inserting all the key-value pairs
> from both objects into a single combined object. If both objects contain
> a value for the same key, the object on the right of the `+` wins. (For
> recursive merge use the `*` operator.)
