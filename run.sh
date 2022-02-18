#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
clear

set -ex

zig build
exec ./zig-out/bin/rmw

