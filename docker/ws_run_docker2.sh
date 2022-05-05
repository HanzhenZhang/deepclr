#!/bin/bash

# Port bindings: -p host_port:container_port
# Port bindings: -p host_port:container_port
read -p "Tensorboard port (host) "  TboardHostPort
read -p "Jupyter Notebook port (host) "  JupyHostPort
# Path where the KITTI Odometry dataset files are kept or to be saved
KITTI_PATH="/mount/HDD2/Datasets/Odometry"
#Path where ModelNet40 are saved
MODELNET40_PATH="/home/hanzhen/ModelNet40"
#Path where the trained models are saved
MODEL_PATH="/home/hanzhen/models"
#Path where the deepclr model are saved
Deepclr="/home/hanzhen/VO_git/deepclr"
#'"device=1"'
docker run -it --gpus "device=0" -v $KITTI_PATH:/KITTI_PATH \
				-v $MODELNET40_PATH:/MODELNET40_PATH \
				-v $Deepclr:/code \
				-v $MODEL_PATH:/MODEL_PATH \
				-p $JupyHostPort:8888 \
				-p $TboardHostPort:6006 \
				ghcr.io/mhorn11/deepclr/deepclr:1.0
cd ..
export KITTI_PATH=/KITTI_PATH
export MODELNET40_PATH=/MODELNET40_PATH

