#!/bin/bash

set -x

WORKDIR=/tmp/workspace/
SOURCEDIR=$WORKDIR/source
TARGETDIR=$WORKDIR/target

mkdir -p $TARGETDIR


pushd /scripts
   make all.nt
popd

gzip $TARGETDIR/all.nt

