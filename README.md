# Nikiro_docker
Nikiro is a ROS 2-based Autonomous Mobile Robot (AMR) platform designed for indoor navigation using a differential drive system. Built with modularity and simulation in mind, Nikiro leverages Gazebo, RViz, and Nav2 for SLAM, localization, and path planning.This the dockerfile and docker compose file for the easy implementaion of the navigation.

# DOCKER INSTALLATION
Binary installation
```
sudo apt install docker.io
```
post installation
```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```
**Xhost Settings**
```
xhost +
```
# DOCKER IMAGE BUILD

```
https://github.com/logesh1516/Nikiro_docker.git
cd Nikiro_docker
docker build -t nikiro_amr .
```
this takes 20+ minutes to build 

# DOCKER COMPOSE

```
cd Nikiro_docker
docker compose up
```
This automatically launches the bringup , navigation and server for external connection.

