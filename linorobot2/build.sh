#!/bin/bash

sudo apt install -y python3-rosdep2
source /opt/ros/humble/setup.bash
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws
git clone -b $ROS_DISTRO https://github.com/linorobot/linorobot2 src/linorobot2
git clone https://github.com/linorobot/linorobot2_viz src/linorobot2_viz
rosdep update && rosdep install --from-path src --ignore-src -y --skip-keys microxrcedds_agent --skip-keys micro_ros_agent
colcon build

echo "export LINOROBOT2_BASE=2wd" >> ~/.bashrc
