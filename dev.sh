#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR


if ! [ -x "$(command -v reflex)" ]; then
go install github.com/cespare/reflex@latest
fi

./run.sh

reflex -r '\.zig$' ./run.sh
