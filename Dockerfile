#Autor: Hadush
#Email: had.hailu@gmail.com
#Date: 09/25/2021
#Module: Dockerfile for map_server

# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images/create_ros_image.Dockerfile.em
FROM ros:noetic-ros-core-focal

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python3-rosdep \
    python3-rosinstall \
    python3-vcstools \
    && rm -rf /var/lib/apt/lists/*

# Make catkin_ws/src
RUN mkdir catkin_ws && cd catkin_ws && mkdir src


# bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO

# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-ros-base=1.5.0-1* \
    && rm -rf /var/lib/apt/lists/*


# Install map_server ros package
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-map-server \
    && rm -rf /var/lib/apt/lists/*

# Install Python3.5
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.5 \
    python3-pip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#Install websocket libraries
RUN pip3 install python-socketio "python-socketio[client]" eventlet
    

