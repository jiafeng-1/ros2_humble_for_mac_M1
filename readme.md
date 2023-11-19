## 说明
**本工程专门针对在MAC系统arm64架构开发ros2 humble版本所搭建的docker工程**
官方的osrf/ros:humble-desktop-full由于是amd64的，在M1芯片上搭建后，各种问题，使用X11进行显示GUI各种问题，容器内节点无法通讯，等等。所以搭建了这个工程。
![](./doc/ros2_humble-desktop-full.png)
欢迎各位pr，共同维护，有问题可git提交issue，后续如果使用的人较多/问题较多，可建群沟通。

## 支持项
目前我测试工程已经支持：
- 显示rviz2 rqt等GUI界面
- 节点通讯
- docker-compose部署
- 不显示界面也可以使用docker部署
- 支持vscode开发

## 文件说明
```bash
➜ tree -a -L 2 
.
├── .DS_Store
├── .devcontainer
│   ├── devcontainer.json   ----- vscode容器开发配置
│   └── docker-compose.yml
├── .github
│   └── workflows
├── Dockerfile
├── auto
│   ├── auto_docker_build.sh ----- docker build镜像脚本
│   ├── auto_docker_run.sh   ----- docker run脚本
│   └── auto_source.sh       ----- 容器内部所用source脚本
├── doc
│   ├── .DS_Store
│   └── ros2_humble-desktop-full.png
├── docker-compose.yml
├── readme.md
├── resource ---------------------- docker build所需资源库
│   ├── metadata.yaml
│   ├── mixin.yaml
│   ├── ros-archive-keyring.gpg
│   └── sources.list
├── ros-archive-keyring.gpg
├── sources.list
├── src ---------------------------- ros软件包存放位置
│   ├── learning_interface
│   ├── learning_pkg_cpp
│   └── learning_pkg_cpp_sub
└── version ------------------------ 提交版本改动记录
```

## ros2软件包功能说明
- learning_topic_cpp      
- learning_service_cpp   
- learning_interface_cpp 
- learning_action_cpp    

