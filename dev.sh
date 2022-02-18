#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex


if ! [ -x "$(command -v reflex)" ]; then
go install github.com/cespare/reflex@latest
fi


run="zig run src/main.zig"

$run

reflex -r '\.zig$' $run
