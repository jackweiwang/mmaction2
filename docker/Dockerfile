ARG PYTORCH="1.7.1"
ARG CUDA="11.0"
ARG CUDNN="8"

FROM pytorch/pytorch:${PYTORCH}-cuda${CUDA}-cudnn${CUDNN}-devel

ENV TORCH_CUDA_ARCH_LIST="6.0 6.1 7.0 8.6+PTX"
ENV TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
ENV CMAKE_PREFIX_PATH="$(dirname $(which conda))/../"

RUN apt-get update && apt-get install -y git ninja-build libglib2.0-0 libsm6 libxrender-dev libxext6 ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install mmcv-full
#RUN pip install mmcv-full==latest+torch1.7.1+cu110 -f https://download.openmmlab.com/mmcv/dist/index.html
RUN pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/cu110/torch1.7.1/index.html
ENV FORCE_CUDA="1"

RUN git clone https://github.com/jackweiwang/mmaction2.git --depth 1 /mmaction2
RUN pip install cython --no-cache-dir
RUN pip install --no-cache-dir -e .
RUN pip install pytest

# Install MMAction2
RUN conda clean --all

WORKDIR /mmaction2

RUN mkdir -p /mmaction2/data

