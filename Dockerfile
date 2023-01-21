FROM ros:noetic-ros-core

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential wget \
    libgoogle-glog-dev libgflags-dev libatlas-base-dev \
    ros-${ROS_DISTRO}-cv-bridge ros-${ROS_DISTRO}-tf ros-${ROS_DISTRO}-message-filters ros-${ROS_DISTRO}-image-transport* \
    ros-${ROS_DISTRO}-eigen-conversions ros-${ROS_DISTRO}-rviz ros-${ROS_DISTRO}-pcl-ros \
    && rm -rf /var/lib/apt/lists/*

COPY ceres-solver ceres-solver
WORKDIR /ceres-solver/ceres-bin
RUN cmake .. && make -j4 && make test && make install


WORKDIR /catkin_ws/src

COPY VoxelMap VoxelMap
COPY livox_ros_driver livox_ros_driver

WORKDIR /catkin_ws
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && catkin_make --cmake-args -DCMAKE_BUILD_TYPE=Release

WORKDIR /
COPY resources/ros_entrypoint.sh .

ARG BAG_FILE=l5152.bag
ENV BAG_FILE=${BAG_FILE}
# COPY resources/${BAG_FILE} .

WORKDIR /catkin_ws

RUN echo 'alias build="catkin_make --cmake-args -DCMAKE_BUILD_TYPE=Release"' >> ~/.bashrc
# RUN echo 'alias run="roslaunch voxel_map docker_rosbag_mapping_avia.launch"' >> ~/.bashrc
