# Coding Style

Even if exercism's challenges are solvable with small source code files, I
tend to always use good practices aimed at code maintainability (aka "Clean Code").
The reason for this is to make good practices such a strong habit that I don't
even need to think about them, I just do them "automatically".

My **Golden Rules** for bash are:

- Always double quote variables. No naked `$` signs.
- All code goes in a function. Even if it's just one function, `main`.
- Always have a `main` function for runnable scripts, called with `main "$@"`.
- Always use `local when setting variables, unless there's a reason to use declare.
- Never use \`backticks\`, use `$( ... )`.


## References

- <https://github.com/progrium/bashstyle>
- <https://wiki.bash-hackers.org/scripting/obsolete>
