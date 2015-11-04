#!/usr/bin/env bash

if [ -e $1 ]; then
    echo "rm -rIv $1"
    rm -rIv $1
fi

if [ -e $2 ]; then
    echo "rm -rIv $2"
    rm -rIv $2
fi

echo "clean end"
