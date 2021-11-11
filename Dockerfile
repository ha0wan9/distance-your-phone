# Configure the environment  
ARG PYTORCH="1.9.1"
ARG CUDA="11.1"
ARG CUDNN="8"

FROM pytorch/pytorch:${PYTORCH}-cuda${CUDA}-cudnn${CUDNN}-devel AS basic_env

ENV TORCH_CUDA_ARCH_LIST="6.0 6.1 7.0+PTX"
ENV TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
ENV CMAKE_PREFIX_PATH="$(dirname $(which conda))/../"

RUN apt-get update \
 && apt-get install -y --no-install-recommends gcc vim git ninja-build libglib2.0-0 libsm6 libxrender-dev libxext6 ffmpeg libxml2-dev libxslt1-dev zlib1g-dev g++\
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /airtouch

