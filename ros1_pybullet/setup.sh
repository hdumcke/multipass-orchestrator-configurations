#!/bin/bash
######################################################################################
# ros1_pybullet
#
# testing ros1_pybullet
#
# To install
#    ./setup.sh
######################################################################################

set -e
echo "setup.sh started at $(date)"

### Get directory where this script is installed
BASEDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# check Ubuntu version
source /etc/os-release

if [[ $UBUNTU_CODENAME != 'focal' ]]
then
    echo "Ubuntu 20.04 LTS (Focal Fossa) is required"
    echo "You are using $VERSION"
    exit 1
fi

cd ~

############################################
# wait until unattended-upgrade has finished
############################################
tmp=$(ps aux | grep unattended-upgrade | grep -v unattended-upgrade-shutdown | grep python | wc -l)
[ $tmp == "0" ] || echo "waiting for unattended-upgrade to finish"
while [ $tmp != "0" ];do
sleep 10;
echo -n "."
tmp=$(ps aux | grep unattended-upgrade | grep -v unattended-upgrade-shutdown | grep python | wc -l)
done

git clone https://github.com/Tiryoh/ros_setup_scripts_ubuntu.git
sudo apt-get update
sudo apt-get -y install python3 python3-pip python-is-python3 python3-venv python3-virtualenv
~/ros_setup_scripts_ubuntu/ros-noetic-ros-base-main.sh
source /opt/ros/noetic/setup.bash
source /usr/lib/python3/dist-packages/catkin_tools/verbs/catkin_shell_verbs.bash
rosdep update

mkdir -p ~/catkin_ws/src
sudo apt-get install -y ros-${ROS_DISTRO}-cv-bridge
cd ~/catkin_ws/src
git clone https://github.com/ros-pybullet/ros_pybullet_interface.git
sed -i "s/^cd .*/cd \/home\/ubuntu\/catkin_ws\/src/" ros_pybullet_interface/install.sh
sed -i "s/apt install/apt install -y/" ros_pybullet_interface/install.sh
sed -i "/workspace/a cd \/home\/ubuntu\/catkin_ws/" ros_pybullet_interface/install.sh
chmod +x ros_pybullet_interface/install.sh
cd ~/catkin_ws
catkin init
./src/ros_pybullet_interface/install.sh
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

echo "setup.sh finished at $(date)"
