#!/bin/bash
# Clever for PC
patch < ../../../../patches/CMakeLists.patch

cp -f ../../../../patches/files_for_clover/launch/aruco.launch ./launch/
cp -f ../../../../patches/files_for_clover/launch/sitl.launch ./launch/
cp -f ../../../../patches/files_for_clover/map.txt ../aruco_pose/map/