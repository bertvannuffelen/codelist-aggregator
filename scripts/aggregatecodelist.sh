#!/bin/bash
#
# 

set -x

# ensure jsonld is found
export PATH=~/.npm-global/bin:$PATH 

SOURCEDIR=$HOME/project/codelist
if [$# -eq 1] ; then 
  if [ -n $1 ] ; then
     SOURCEDIR=$HOME/project/$1
  fi
fi


WORKDIR=/tmp/workspace/
TARGETDIR=$WORKDIR/target

export SOURCEDIR=$SOURCEDIR
export TARGETDIR=$TARGETDIR

mkdir -p $TARGETDIR


pushd /scripts
   make all.ttl
popd


validate-shacl -s @/scripts/concept-shapes.ttl -d @/$TARGETDIR/all.ttl

gzip $TARGETDIR/all.nt

