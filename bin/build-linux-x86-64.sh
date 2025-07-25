#!/usr/bin/env bash

set -euxo pipefail

export CFLAGS="\
  -DSQLITE_ENABLE_FTS3 \
  -DSQLITE_ENABLE_FTS3_PARENTHESIS \
  -DSQLITE_ENABLE_FTS4 \
  -DSQLITE_ENABLE_FTS5 \
  -DSQLITE_ENABLE_JSON1 \
  -DSQLITE_ENABLE_LOAD_EXTENSION \
  -DSQLITE_ENABLE_RTREE \
  -DSQLITE_ENABLE_STAT4 \
  -DSQLITE_ENABLE_UPDATE_DELETE_LIMIT \
  -DSQLITE_SOUNDEX \
  -DSQLITE_TEMP_STORE=3 \
  -DSQLITE_USE_URI \
  -O2 \
  -fPIC"

export LIBS="-lm"

git submodule update --init
docker run --rm \
       -e CFLAGS="$CFLAGS" \
       -e PREFIX="$(pwd)/artifacts/linux-x86-64" \
       -e LIBS="-lm" \
       -v "$(pwd)":"$(pwd)" \
       -w "$(pwd)/sqlite" \
       debian:11.0 \
       bash -c '\
            apt update && \
              apt install -y build-essential tcl && \
              ./configure \
                  --disable-tcl \
                  --enable-shared \
                  --prefix="$PREFIX" && \
              make clean && \
              make && \
              make install'
