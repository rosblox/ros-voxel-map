
# ros-voxel-map

This repository uses Github Actions, i.e. Github's  continuous integration and continuous delivery (CI/CD) platform, to automatically build and deliver Docker images for a popular ROS package.

The Docker image offers a convenient way to run nodes and launch files of the ROS package without having to compile it on a local computer and having to worry about its dependencies such as specific library or OS versions.

# VoxelMap

This repository creates a Docker image with 
[ROSblox's VoxelMap](https://github.com/rosblox/VoxelMap) 
ROS package, which is a fork with no/minor modifications in comparison to its parent repository, 
[HKU-Mars-Lab's VoxelMap](https://github.com/hku-mars/VoxelMap)
. Checkout the repository's README.md for more information about this ROS package.

# Prerequisites to running the Docker image

## Install docker

Install the Docker engine, https://docs.docker.com/get-docker/.


## Login to Github's container registry
```
docker login ghcr.io
```

## Clone this repository
```
git clone https://github.com/rosblox/ros-voxel-map.git
```


# Running the ROS package

## Start the container
```
cd ./ros-voxel-map
./run.sh
```
Note, the Docker image is pulled automatically once, if it hasn't been pulled yet.

## Start the ROS package
Inside the container, start ROS package by executing
```
run
```
Note, the `run` command is an alias defined in the `~/.bashrc` to launch the ROS package's launch file.


# Additional info


## Update your (local) Docker image

This repository's automatically built Docker image is uploaded to Github's Container Registry (ghcr.io). Newer versions of the Docker image can be pulled by running
```
docker pull ghcr.io/rosblox/ros-voxel-map:noetic
```

## Build Docker image locally
For convenience, there is a `build.sh` script located at the root of the repository. Run 
```
./build.sh
```
to build the Docker image on your local computer, e.g. when you made changes to the Dockerfile.

## Update the ROS package in the (automatically built) Docker image

To include updates of the ROS package's parent repository,
[HKU-Mars-Lab's VoxelMap](https://github.com/hku-mars/VoxelMap)
, in the automatically built Docker images, please create a [Pull Request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) to 
[ROSblox's VoxelMap](https://github.com/rosblox/VoxelMap) 
fork with the changes. 

