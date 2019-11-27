#!/bin/bash

set -x

# ensure jsonld is found
export PATH=~/.npm-global/bin:$PATH 


WORKDIR=/tmp/workspace/
SOURCEDIR=$WORKDIR/source
TARGETDIR=$WORKDIR/target

mkdir -p $TARGETDIR


pushd /scripts
   make all.nt
popd

gzip $TARGETDIR/all.nt

