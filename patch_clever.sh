#!/bin/bash
# Clever for PC
patch < ../../../../patches/CMakeLists.patch

cp -f ../../../../patches/files_for_clover/aruco.launch ./launch/
cp -f ../../../../patches/files_for_clover/sitl.launch ./launch/