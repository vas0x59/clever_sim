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

../../../../patch_clever.sh
# END

# DEP
cd ../../../
rosdep install -y --from-paths src --ignore-src -r

# END

catkin_make
source devel/setup.bash

### END

cd ../


### PX4
git clone https://github.com/CopterExpress/Firmware.git
cd Firmware
cd Tools/sitl_gazebo/include
patch < ../../../../patches/gazebo_opticalflow_plugin.patch
cd ../../../
DONT_RUN=1 make px4_sitl_default gazebo
cp -fRa ../models/iris ./Tools/sitl_gazebo/models
cp -fRa ../models/aruco_map_10_10 ./Tools/sitl_gazebo/models
cp -f ../worlds/empty.world ./Tools/sitl_gazebo/worlds
source Tools/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Tools/sitl_gazebo
export GAZEBO_MODEL_PATH=$(pwd)/models:$GAZEBO_MODEL_PATH
cd ../
source ./env.sh
