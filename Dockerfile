#Autor: Hadush
#Email: had.hailu@gmail.com
#Date: 09/25/2021
#Module: Dockerfile for map_server

# This is an auto generated Dockerfile for ros:ros-base
# Generated from docker_images/create_ros_image.Dockerfile.em
FROM ros:melodic-ros-core-bionic

# Install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*

# Make catkin_ws/src
RUN mkdir catkin_ws && cd catkin_ws && mkdir src

# Bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO

# Install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-melodic-ros-base=1.4.1-0* \
    && rm -rf /var/lib/apt/lists/*

# Install map_server ros package
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-melodic-map-server \
    && rm -rf /var/lib/apt/lists/*  
