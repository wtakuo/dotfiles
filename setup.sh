#!/bin/sh

thisdir=$(cd $(dirname $0) && pwd)

rm -f $thisdir/*~

for f in $thisdir/dot.*; do
    f0=$(basename $f)
    f1=$HOME/${f0##dot}
    if [ $f1 != $HOME/ ]; then
        rm -rf $f1
        ln -sf $f $f1
    fi
done

clinitfile=$thisdir/clinit.lisp
clinits=".sbclrc .ccl-init.lisp"
if [ -f $clinitfile ]; then
    for f in $clinits; do
        rm -f $HOME/$f
        ln -sf $clinitfile $HOME/$f
    done
fi


