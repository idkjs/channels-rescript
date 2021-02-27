type t = {a: int, b: int}
let make = (~a=1, ~b=2, ()) => {a, b}
let test = make(~a=1, ~b=2, ())
Js.log(test)
// https://rescript-lang.org/docs/manual/latest/try#quickly-evaluate-code-in-terminal
//  [I] ➜ bsc -i src/John.res
// type t = {a: int, b: int}
// let make: (~?a: int, ~?b: int, unit) => t
// let test: t
// bsc  src/John.res > src/John.bs.js
