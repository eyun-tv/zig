#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

clear
zig build
exec ./zig-out/bin/zig

