#!/bin/bash
set -e

# setup ros2 environment
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
echo "source /home/ubuntu/micro_ros/install/local_setup.bash" >> ~/.bashrc
echo "source /home/ubuntu/nikiro_amr/install/setup.bash" >> ~/.bashrc
echo "export LINOROBOT2_LASER_SENSOR=ydlidar" >> ~/.bashrc
exec "$@"
