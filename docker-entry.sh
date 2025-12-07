#!/usr/bin/env bash

SRC_DIR="/mnt/cpack-exercise"
OUT_DIR="/out"
BUILD_DIR="/tmp/build"

pwd
mkdir $BUILD_DIR
mkdir $OUT_DIR
ls

cmake -S "$SRC_DIR" -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DCPACK_PACKAGE_DIRECTORY="$BUILD_DIR"

make -C "$BUILD_DIR" -j package

results=(
  "$BUILD_DIR"/*.tar.gz
  "$BUILD_DIR"/*.deb
)

for f in "${results[@]}"; do
  cp -f "$f" "$OUT_DIR/"
done

ls -l "$OUT_DIR"