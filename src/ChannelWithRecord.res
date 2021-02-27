

open Channel

let end' = _ => () /* = ignore from Pervasives */
// let end2' = () => ()
let filter = (source, pred) => {
  Js.log2("source", source)
  Js.log2("predpred", pred)
  let target = create()
    Js.log2("target", target)

  source->listen(m => pred(m) ? target->send(m)->end' : ())
  to_read_only(target)
}

let chan = create()
let test = John.make(~a=1, ~b=2, ())
chan->filter((i:John.t) => i.b > 0)->listen(i => Js.log2("i>0", i.b))->end'
// chan->filter(i => i.a > 0)->listen(i => Js.log2("i>0", i.a))->end'

// chan->send(test)->send({let {a,_}=test a})->send(test.a + 13)->send(test.b)->end'

chan->send(test)->end'
