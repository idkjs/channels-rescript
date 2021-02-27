/* File Example.re; this is a comment. */

open Channel
/* Make available all the visible definitions of module Channel. */

let chan = create()
/* Apply Channel.create to a unit argument (), and
   return a value of type t('a) which will be thereafter
   available as chan. The type 'a is not yet instantiated. */

let _ = send(chan, 5)
/* Apply Channel.send to chan of type t('a) and 5 of type int,
   with the intended semantics of sending 5.
   The type unification algorithm will introduce the equation
   'a=int to satisfy the signature of send, and the channel
   now has type t(int). */

let msg = recv_sync(chan);
switch(msg) {
  | Some(m) => Js.log2(" Do something with m. ", m)
  | None => Js.log(" Handle the no message case. ")
}

let _ = recv(chan, x => Js.log(x + 5))
/* Receive a value from chan and use it to print on the console;
   because of the send above, x will be constrained to have the type
   int, since chan has type t(int). The callback x => Js.log(x + 5)
   has type int => unit, which matches 'a => unit in the interface. */

let msg = recv_sync(chan);
switch(msg) {
  | Some(m) => Js.log2(" Do something with m. ", m)
  | None => Js.log(" Handle the no message case. ")
}
