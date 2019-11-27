#!/bin/bash

set -x

# ensure jsonld is found
export PATH=~/.npm-global/bin:$PATH 


WORKDIR=/tmp/workspace/
SOURCEDIR=$WORKDIR/source
TARGETDIR=$WORKDIR/target

mkdir -p $TARGETDIR


pushd /scripts
   make all.ttl
popd


validate-shacl -s @/scripts/concept-shapes.ttl -d @/$TARGETDIR/all.ttl

gzip $TARGETDIR/all.nt

