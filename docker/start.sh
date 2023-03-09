#!/bin/bash
cd "$(dirname "$0")"
cd ..

workspace_dir=$PWD

if ["$(docker ps -aq -f status=exited -f name=super)" ]; then
    docker rm super
fi

docker run -it -d --rm \
    --gpus all  \
    --net host \
    -e "NVIDIA_DRIVER_CAPABILITIES=all" \
    -e "DISPLAY" \
    -e "QT_X11_NO_MITSHM=1" \
    --shm-size="35g" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --name super \
    -v $workspace_dir/:/home/trainer/super:rw \
    -v /home/yazan/datasets/:/home/trainer/Datasets/:rw \
    x64/super:latest

# docker exec -it dyna\
#     /bin/bash -c "
#     cd /home/trainer/dyna;
#     pip install -e ./"
#     # \ '"device=0"'
