# RPL Scripts for ROS2
Commonly used scripts for new computers installed at the RPL lab.

# Support
> Note: The current version of Ubuntu used at RPL is 22.04 LTS with ROS2 Humble
- Ubuntu 20.04 LTS, 22.04 LTS
- ROS2 Foxy, Humble

# Installation Instructions

## Basic Setup: git, cmake

1. Install basic GIT and cmake packages:
```bash
sudo apt-get install git cmake cmake-curses-gui terminator vim net-tools
```

2. Configure GIT, with your own credentials:
```bash
git config --global user.name "FirstName LastName"
git config --global user.email "email@example.com"
git config --global color.pager true
git config --global color.ui auto
```

3. Create new SSH key (public/private rsa key pair), with your own credentials:
```bash
ssh-keygen -t rsa -C "email@example.com"
```

4. Add RSA identity to the authentication agent:
```bash
ssh-add
cat ~/.ssh/id_rsa.pub
```

5. Add the extracted ssh-rsa key into your host ssh keys, e.g. for github in github-keys (https://github.com/settings/keys).

6. Add the following to your ~/.bashrc:
```bash
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
```

7. Install the basic dependencies
```bash
git clone https://github.com/rpl-as-ucl/RPL-Scripts.git
cd RPL-Scripts
sudo chmod u+x ros2_setup.sh
./ros2_setup.sh
```

8. Add ROS2 environment variables to your .bashrc:
```bash
# 替换 ROS_DISTRO 为 'humble' 或 'foxy'
echo "source /opt/ros/\$ROS_DISTRO/setup.bash" >> ~/.bashrc
# 建议也添加本地工作空间的设置
echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

9. Dependencies for building packages:
```bash
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-colcon-common-extensions build-essential
sudo rosdep init
rosdep update
```

10. Video/Images Tools
```bash
sudo apt install gimp inkscape openshot handbrake
```

# Installing PCL/OpenCV
```bash
sudo apt install ros-$ROS_DISTRO-perception-pcl ros-$ROS_DISTRO-pcl-*
sudo apt install ros-$ROS_DISTRO-cv-bridge
sudo apt install ros-$ROS_DISTRO-vision-opencv
sudo apt install ros-$ROS_DISTRO-tf2-tools
```

# Installing RealSense
```bash
sudo apt install ros-$ROS_DISTRO-realsense2-*
sudo apt install ros-$ROS_DISTRO-librealsense2*
```

# Installing WiFi Adapter (Brostrend AC1200 Realtek Semiconductor Corp.)
For Ubuntu 22.04 LTS:
```bash
sudo apt update
sudo apt install dkms bc git
git clone https://github.com/RinCat/RTL88x2BU-Linux-Driver.git
cd RTL88x2BU-Linux-Driver
make
sudo make install
sudo modprobe 88x2bu
```

# Installing NVIDIA Drivers
For Ubuntu 22.04 LTS:
```bash
ubuntu-drivers devices
sudo ubuntu-drivers autoinstall
```

# Installing VRviz Drivers
For Ubuntu 22.04 LTS:
```bash
sudo apt install libglew-dev libassimp-dev
sudo add-apt-repository multiverse
sudo apt install steam steam-devices
sudo apt install libvulkan1
steam
```

# Installing Acrobat Reader
For Ubuntu 22.04 LTS:
```bash
sudo apt update
sudo apt upgrade
wget -O ~/adobe.deb ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb
sudo dpkg --add-architecture i386
sudo apt install libxml2:i386 libcanberra-gtk-module:i386 gtk2-engines-murrine:i386 libatk-adaptor:i386 libgdk-pixbuf-xlib-2.0-0:i386
sudo dpkg -i ~/adobe.deb
acroread
```

# Setting up Nvidia Jetson Orin Developer Kit
After having run through the Ubuntu setup, check your L4T version first:
```bash
cat /etc/nv_tegra_release
```

If L4T version is older than "# R34 (release), REVISION: 1.0 or ...":
```bash
sudo bash -c 'echo "deb https://repo.download.nvidia.com/jetson/common r34.1 main" >> /etc/apt/sources.list.d/nvidia-l4t-apt-source.list'
sudo bash -c 'echo "deb https://repo.download.nvidia.com/jetson/t234 r34.1 main" >> /etc/apt/sources.list.d/nvidia-l4t-apt-source.list'
```

If your version is R34 or newer:
```bash
sudo apt update
sudo apt dist-upgrade
sudo reboot
sudo apt install nvidia-jetpack
```

For further information or clarification see [installation guide](https://developer.nvidia.com/embedded/learn/get-started-jetson-agx-orin-devkit "nvidia Orin getting started website").