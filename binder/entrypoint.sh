#!/bin/bash

source ${HOME}/workspace/ros/devel/setup.bash

roscore &
roslaunch --wait rvizweb rvizweb.launch &
#roslaunch --wait cram_projection_demos retail_donbot.launch &


jupyter lab workspaces import ${HOME}/.binder/rviz_config/retail_donbot.launch.json

# Use xvfb virtual display when there is no display connected.
#if [ -n "$DISPLAY" ]; then
#    exec "$@"
#else
    xvfb-run exec "$@"
#fi
