# ROS Environment Setup Scripts
这个仓库包含了常用的ROS环境配置脚本, 支持ROS1和ROS2基础库安装。

## 目录结构
- `ros1/`: ROS1 (Kinetic/Melodic/Noetic) 环境配置脚本
- `ros2/`: ROS2 (Dashing/Foxy/Humble) 环境配置脚本

## 使用说明

### ROS1 环境配置
如果您需要配置ROS1环境:
1. 进入ros1目录: `cd ros1`
2. 查看README.md获取详细安装步骤
3. 运行基础配置脚本: `./basic_setup.sh`

支持的Ubuntu和ROS1版本:
- Ubuntu 16.04 LTS + ROS Kinetic
- Ubuntu 18.04 LTS + ROS Melodic  
- Ubuntu 20.04 LTS + ROS Noetic

### ROS2 环境配置
如果您需要配置ROS2环境:
1. 进入ros2目录: `cd ros2`
2. 查看README.md获取详细安装步骤
3. 运行基础配置脚本: `./basic_setup.sh`

支持的Ubuntu和ROS2版本:
- Ubuntu 18.04 LTS + ROS2 Dashing
- Ubuntu 20.04 LTS + ROS2 Foxy
- Ubuntu 22.04 LTS + ROS2 Humble

## 注意事项
- 请确保在运行脚本前仔细阅读相应目录下的README.md文件
- 脚本会自动安装大量依赖包，请确保有足够的磁盘空间
- 建议在全新安装的Ubuntu系统上运行这些脚本
