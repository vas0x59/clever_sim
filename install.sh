#!/bin/bash
### CLEVER
mkdir -p catkin_ws/src
cd catkin_ws/src
cd ../
catkin_make
source devel/setup.bash
cd src
git clone https://github.com/CopterExpress/clever.git

# Patching

cd clever
cd clover 
patch < ../../../../patches/CMakeLists.patch
# END

# DEP
cd ../../../
rosdep install -y --from-paths src --ignore-src -r

# END

catkin_make
source devel/setup.bash

### END

cd ../


