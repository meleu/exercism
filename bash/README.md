# My bash Coding Style

Even if exercism's challenges are solvable with small source code files, I
tend to always use good practices aimed at code maintainability (aka "Clean Code").
The reason for this is to make good practices such a strong habit that I don't
even need to think about them, I just apply them "automatically".

My **Golden Rules** for bash are:

- Always double quote variables. No naked `$` signs.
- All code goes in a function. Even if it's just one function, `main`.
- Always have a `main` function for runnable scripts, called with `main "$@"`.
- Always use `local when setting variables, unless there's a reason to use declare.
- Never use \`backticks\`, use `$( ... )`.
- Use [shellcheck](https://github.com/koalaman/shellcheck) to analyze your script.

**References:**

- <https://github.com/progrium/bashstyle>
- <https://wiki.bash-hackers.org/scripting/obsolete>


## Useful Concepts

Concepts I usually use in my solutions:

- Associative arrays:
  https://mywiki.wooledge.org/BashGuide/Arrays

- Control Operators (&& and ||):
  https://mywiki.wooledge.org/BashGuide/TestsAndConditionals#Control_Operators

- Parameter Expansion: e.g.: `${var//pattern/replace}`
  https://mywiki.wooledge.org/BashGuide/Parameters#Parameter_Expansion

- Arithmetic Evaluation: e.g.: `(( var += i * number))`
  https://mywiki.wooledge.org/BashGuide/CompoundCommands#Arithmetic_Evaluation

- Safe ways to assign a command's output to an array:
  https://github.com/koalaman/shellcheck/wiki/SC2207
