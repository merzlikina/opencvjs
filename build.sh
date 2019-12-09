#!/bin/bash
set -vex

RESULTED_DIR="opencv/compiled"

# copied from https://emscripten.org/docs/getting_started/downloads.html:

# Get the emsdk repo
git clone https://github.com/emscripten-core/emsdk.git

# Enter that directory
cd emsdk

# Download and install the latest SDK tools.
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh

cd ..

python build_js.py $RESULTED_DIR --build_wasm --emscripten_dir emsdk/upstream/emscripten --opencv_dir "opencv"