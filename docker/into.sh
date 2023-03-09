#!/bin/bash
docker exec -it super\
    /bin/bash -c "
    cd /home/trainer/super;
    nvidia-smi;
    /bin/bash"