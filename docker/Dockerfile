FROM nvidia/cuda:11.7.0-cudnn8-runtime-ubuntu20.04
RUN apt-get update && apt install --no-install-recommends -y build-essential

FROM yubaoliu/dynaslam

#Update cuda driver
WORKDIR /home
RUN apt install -y gnupg-curl
RUN rm /etc/apt/sources.list.d/cuda.list
#RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-key del 7fa2af80
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64/7fa2af80.pub


ARG DEBIAN_FRONTEND=noninteractive

#uninstall opencv
WORKDIR /root
RUN find / -name "*opencv*" -exec rm -rf -i {} \;

#install opencv
# graphcuts.cpp needed for 2.4.11
WORKDIR /root
COPY install_opencv24.sh /root/
COPY FindCUDA.cmake /root/
COPY graphcuts.cpp /root/    
RUN ./install_opencv24.sh


#Eigen
COPY eigen-3.3.9.zip /opt/eigen-3.3.9.zip
# COPY eigen-3.3.9.zip /usr/include/eigen-3.3.9.zip
RUN cd /opt && unzip eigen-3.3.9.zip  && cd eigen-3.3.9 && mkdir build && cd build \
&& cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE .. \
&& make install

RUN apt-get update && apt install -y libboost-all-dev
RUN apt-get install -y libglew-dev
RUN apt-get install -y cmake
RUN apt-get install -y libpython2.7-dev
RUN apt-get install -y ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev
RUN apt-get install -y libdc1394-22-dev libraw1394-dev
RUN apt-get install -y libjpeg-dev libtiff5-dev libopenexr-dev




# #download SuperPoint_SLAM
WORKDIR /root
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y nano gawk git libcanberra-gtk-module libcanberra-gtk3-module libatlas3-base \
    libgtkglext1 libgtkglext1-dev && \
    git clone https://github.com/YznMur/SuperPoint_SLAM.git

WORKDIR /root/SuperPoint_SLAM
RUN apt-get update  && \
    export TF_CPP_MIN_LOG_LEVEL=2

WORKDIR /root/SuperPoint_SLAM/
RUN git clone --recursive -b v1.0.1 https://github.com/pytorch/pytorch && \
    cd pytorch && mkdir build && cd build && \
    python ../tools/build_libtorch.py 

RUN chmod +x build.sh \
    && ./build.sh