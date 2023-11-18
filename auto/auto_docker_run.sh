###
 # @Descripttion: 
 # @Author: Jia Feng
 # @version: 
 # @Date: 2023-11-18 20:44:22
 # @LastEditors: Jia Feng
 # @LastEditTime: 2023-11-18 23:54:00
### 

docker run -itd --net=host \
    -v ${pwd}/../../ws_humble:/home/jiafeng/ros \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=192.168.1.102:0 \
    -e GDK_SCALE \
    -e GDK_DPI_SCALE \
    -e LIBGL_ALWAYS_INDIRECT=1 \
    -e ROS_DOMAIN_ID=55 \
    --name ros2_humble \
    --privileged=true \
    jiaxiaofeng/ros2_humble_mac_m1:1.0 \
    /bin/bash


