#!/bin/bash

source ${HOME}/workspace/ros/devel/setup.bash

roscore &
roslaunch --wait rvizweb rvizweb.launch &
roslaunch --wait roslaunch cram_projection_demos everything.launch retail:=true donbot:=true upload_robot:=true tf2_buffer:=true &


jupyter lab workspaces import ${HOME}/.binder/rviz_config/retail_donbot.launch.json

# Use xvfb virtual display when there is no display connected.
if [ -n "$DISPLAY" ]; then
    exec "$@"
else
    xvfb-run exec "$@"
fi
