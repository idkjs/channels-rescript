type t<'a> = Empty | Queue('a, list<'a>)

let make = (x: 'a) => Queue(x, list{})

let enqueue = (x: t<'a>, y: 'a) =>
  switch x {
  | Empty => make(y)
  | Queue(a, list{}) => Queue(a, list{y})
  | Queue(a, b) => Queue(a, List.append(b, list{y}))
  }

let dequeue = (x: t<'a>) =>
  switch x {
  | Empty => (None, Empty)
  | Queue(a, list{}) => (Some(a), Empty)
  | Queue(a, list{h, ...t}) => (Some(a), Queue(h, t))
  }

let getFront = (x: t<'a>) =>
  switch x {
  | Empty => None
  | Queue(a, _) => Some(a)
  }

let length = (x: t<'a>) =>
  switch x {
  | Empty => 0
  | Queue(_, list{}) => 1
  | Queue(_, b) => 1 + List.length(b)
  }

let queue = make("0");
let queue = enqueue(queue, "1");
let queue = enqueue(queue, "2");

Js.log(queue);
Js.log("<<<<<<<<<<");

let (first, queue) = dequeue(queue);
Js.log(first);
Js.log(queue);
Js.log("<<<<<<<<<<");

Js.log(getFront(queue));
Js.log("<<<<<<<<<<");

Js.log(length(queue));
