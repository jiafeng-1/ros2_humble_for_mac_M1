# Use the official ROS image as the base image
FROM ros:humble-ros-core-jammy

WORKDIR /home/jiafeng/ros/

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
COPY . /home/jiafeng/ros/
ADD sources.list /etc/apt/ 

# Set shell for running commands
SHELL ["/bin/bash", "-c"]

# RUN apt-get update && apt-get install --no-install-recommends -y \
#   curl \
#   gnupg2 \
#   && rm -rf /var/lib/apt/lists/*

# RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg


ADD ros-archive-keyring.gpg /usr/share/keyrings/

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] https://mirrors.tuna.tsinghua.edu.cn/ros2/ubuntu jammy main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null


# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    git \
    python3-colcon-common-extensions \
    python3-colcon-mixin \
    python3-pip \
    python3-rosdep \
    python3-vcstool \
    && rm -rf /var/lib/apt/lists/*

# install rosdepc
RUN pip install rosdepc \
  rosdepc init \
  rosdepc update
  
# bootstrap rosdep
# RUN rosdep init && \
#   rosdep update --rosdistro $ROS_DISTRO

# setup colcon mixin and metadata
RUN colcon mixin add default \
      https://gitee.com/zhenshenglee/colcon-mixin-repository/raw/master/index.yaml && \
    colcon mixin update && \
    colcon metadata add default \
      https://gitee.com/aviana-zheng/colcon-metadata-repository/raw/master/index.yaml && \
    colcon metadata update

# RUN colcon mixin add default \
#       https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml && \
#     colcon mixin update && \
#     colcon metadata add default \
#       https://raw.githubusercontent.com/colcon/colcon-metadata-repository/master/index.yaml && \
#     colcon metadata update

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-desktop=0.10.0-1* \
    && rm -rf /var/lib/apt/lists/*

# Set the entrypoint to source ROS setup.bash and run a bash shell
CMD ["/bin/bash"]
