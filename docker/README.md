
# Build the docker 
Run the following command to build the docker. Building the docker can take a while, and at least 15GB from disk space.
```
mkdir Dataset
cd docker
./build.sh
```

# Run the docker
The following command will open a docker terminal
```
cd ..
./docker/start.sh
./docker.into.sh
```
# Access data from/to Docker
To move files from/to the docker just move to the ```Dataset``` folder (for example, the SLAM sequence dataset)