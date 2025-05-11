cmake_minimum_required(VERSION 3.5)
project(nikiro_amr_description)

find_package(ament_cmake REQUIRED)
find_package(urdf REQUIRED)

install(
  DIRECTORY launch  rviz
  DESTINATION share/${PROJECT_NAME}
)

ament_package()
