#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR


if ! [ -x "$(command -v watchexec)" ]; then
cargo install watchexec-cli
fi

watchexec ./run.sh

