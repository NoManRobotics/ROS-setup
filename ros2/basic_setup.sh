#!/bin/sh

# Configure your Ubuntu repositories to allow "restricted", "universe", and "multiverse"
sudo add-apt-repository restricted 
sudo add-apt-repository universe 
sudo add-apt-repository multiverse

# Update
sudo apt-get update

# essential
sudo apt-get install -y git cmake cmake-curses-gui build-essential gitg git-gui meld vim terminator mercurial libmatio-dev doxygen kazam kdevelop net-tools curl gnupg2 lsb-release

# Set locale
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Add the ROS 2 GPG key
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Add the repository to sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Update package lists
sudo apt update

# Ubuntu 18.04LTS (Bionic)
if [ "`lsb_release -cs`" = 'bionic' ]; then
    sudo apt-get install -y ros-dashing-desktop
    sudo apt-get install -y \
        ros-dashing-eigen-conversions \
        ros-dashing-kdl-parser \
        ros-dashing-effort-controllers \
        ros-dashing-transmission-interface \
        ros-dashing-gazebo-ros* \
        ros-dashing-joint-state* \
        ros-dashing-control* \
        ros-dashing-moveit* \
        ros-dashing-navigation2 \
        ros-dashing-nav2-* \
        ros-dashing-joint-trajectory-controller \
        ros-dashing-joint-state-publisher-gui \
        ros-dashing-xacro \
        ros-dashing-ros2-control \
        ros-dashing-ros2-controllers

    # Environment Setup
    echo "source /opt/ros/dashing/setup.bash" >> ~/.bashrc
    source ~/.bashrc

    # Dependencies for building packages
    sudo apt install -y python3-pip python3-colcon-common-extensions python3-rosdep python3-vcstool
fi

# Ubuntu 20.04LTS (Focal)
if [ "`lsb_release -cs`" = 'focal' ]; then
    sudo apt-get install -y ros-foxy-desktop
    sudo apt-get install -y \
        ros-foxy-eigen-conversions \
        ros-foxy-kdl-parser \
        ros-foxy-effort-controllers \
        ros-foxy-transmission-interface \
        ros-foxy-gazebo-ros* \
        ros-foxy-joint-state* \
        ros-foxy-control* \
        ros-foxy-moveit* \
        ros-foxy-navigation2 \
        ros-foxy-nav2-* \
        ros-foxy-joint-trajectory-controller \
        ros-foxy-joint-state-publisher-gui \
        ros-foxy-xacro \
        ros-foxy-ros2-control \
        ros-foxy-ros2-controllers

    # Environment Setup
    echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
    source ~/.bashrc

    # Dependencies for building packages
    sudo apt install -y python3-pip python3-colcon-common-extensions python3-rosdep python3-vcstool
fi

# Ubuntu 22.04LTS (Jammy)
if [ "`lsb_release -cs`" = 'jammy' ]; then
    sudo apt-get install -y ros-humble-desktop-full
    sudo apt-get install -y \
        ros-humble-eigen-conversions \
        ros-humble-kdl-parser \
        ros-humble-effort-controllers \
        ros-humble-transmission-interface \
        ros-humble-gazebo-ros* \
        ros-humble-joint-state* \
        ros-humble-control* \
        ros-humble-moveit* \
        ros-humble-navigation2 \
        ros-humble-nav2-* \
        ros-humble-joint-trajectory-controller \
        ros-humble-joint-state-publisher-gui \
        ros-humble-xacro \
        ros-humble-ros2-control \
        ros-humble-ros2-controllers \
        ros-humble-gazebo-ros2-control

    # Environment Setup
    echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
    source ~/.bashrc

    # Dependencies for building packages
    sudo apt install -y python3-pip python3-colcon-common-extensions python3-rosdep python3-vcstool
fi

# Initialize rosdep
sudo rosdep init
rosdep update

# Install Gazebo
sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
sudo apt-get update
sudo apt-get install -y gz-garden

# Print installation complete message
echo "ROS 2 installation completed!"
echo "Please restart your terminal or run: source ~/.bashrc"