// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Curry = require("bs-platform/lib/js/curry.js");
var Channel = require("./Channel.bs.js");

function end$prime(param) {
  
}

function filter(source, pred) {
  console.log("source", source);
  console.log("predpred", pred);
  var target = Channel.create(undefined);
  Channel.listen(source, (function (m) {
          if (Curry._1(pred, m)) {
            Channel.send(target, m);
            return ;
          }
          
        }));
  return Channel.to_read_only(target);
}

var chan = Channel.create(undefined);

Channel.listen(filter(chan, (function (i) {
            return i > 0;
          })), (function (i) {
        console.log("i>0", i);
        
      }));

Channel.send(Channel.send(Channel.send(Channel.send(chan, 1), -1), 13), 4);

Channel.send(chan, 2);

exports.end$prime = end$prime;
exports.filter = filter;
exports.chan = chan;
/* chan Not a pure module */
