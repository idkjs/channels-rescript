#!/bin/bash
set -e

# bsc -i  lib/bs/src/$1.cmi > src/$1.mli
# bsc -format src/$1.mli > src/$1.resi
# rm src/$1.mli

bsc -i src/$1.res > src/$1.mli
refmt --parse ml --print re "$1" >"${1%.mli}.rei"
bsc -format src/$1.rei > src/$1.resi
rm src/$1.mli
