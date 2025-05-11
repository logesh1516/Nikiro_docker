
FROM osrf/ros:humble-desktop-full
RUN apt-get update && apt-get upgrade -y
RUN apt install -y \
    ros-humble-robot-localization \
    ros-humble-joint-state-publisher \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    ros-humble-rosbridge-suite

COPY micro_ros /home/ubuntu/micro_ros
COPY nikiro_amr /home/ubuntu/nikiro_amr
RUN cd /home/ubuntu && git clone https://github.com/YDLIDAR/YDLidar-SDK.git

RUN cd /home/ubuntu/YDLidar-SDK && \
    mkdir build && cd build && cmake .. && make && make install

SHELL ["/bin/bash", "-c"]

RUN source /opt/ros/humble/setup.bash && \
    cd /home/ubuntu/nikiro_amr && colcon build

COPY ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh

WORKDIR /home/ubuntu/nikiro_amr
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

