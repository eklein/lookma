#!/bin/sh

# Apply a set of patches to a source tree.

die()
{
    echo "error: Patch failed." 1>&2
    exit 1
}

if [ $# -lt 2 ]; then
    echo "usage: apply-patches.sh TARGET [PATCH ...]" 1>&2
    echo "Applies all PATCHes listed on command line to the source tree at TARGET." 1>&2
    exit 1
fi
TARGET=$1
shift

if [ ! -d ${TARGET} ]; then
    echo "error: ${TARGET}: not a directory" 1>&2
    exit 1
fi

for patch in "$@"; do
    if [ ! -f ${patch} ]; then
        echo "error: ${patch}: does not exist" 1>&2
        exit 1
    fi
    echo Applying ${patch}...
    patch -d ${TARGET} -p1 -s < ${patch} || die
done
