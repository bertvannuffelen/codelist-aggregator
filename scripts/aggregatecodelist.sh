#!/bin/bash

set -x

WORKDIR=/tmp/workdir/
SOURCEDIR=$WORKDIR/source
TARGETDIR=$WORKDIR/target

mkdir -p $TARGETDIR

cp /scripts/Makefile $SOURCEDIR

pushd $SOURCEDIR
   make all.nt
popd

cp $SOURCEDIR/all.nt $TARGETDIR
gzip $TARGETDIR/all.nt

