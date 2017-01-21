# Before you start
This is intended to be a **demo** setup to run hardware accelerated content on AWS G2 instances https://aws.amazon.com/ec2/instance-types/#g2

# Requirements
These scripts must be run on a G2 EC2 box running Ubuntu 16.04 (HVM).

# What is included?
Among the other packages these scripts will install
- nvidia drivers v367.57 http://www.nvidia.com/download/driverResults.aspx/108586/en-us
- VirtualGL v2.5.1 http://www.virtualgl.org/
- TurboVNC http://www.turbovnc.org/
- docker https://www.docker.com/
- nvidia-docker https://github.com/NVIDIA/nvidia-docker
- nvidia-docker-compose https://github.com/eywalker/nvidia-docker-compose
- a barebone Mate desktop https://mate-desktop.org/

# Installation
SSH into your EC2 box, once in just run the following
```bash
git clone https://github.com/plumbee/nvidia-hw-accelerated-box.git
cd nvidia-hw-accelerated-box
sudo su
source setup.sh
```
Keep in mind that:
- The installation will reboot the machine once done.
- At the startup the VNC server will start on DISPLAY :1.

# VNC access
## Password
VNC password is dynamically set to the first 8 characters of your EC2 instance id.
## Display
VNC starts on DISPLAY :1, VirtualGL content will render offscreen and the resulting image will be copied to DISPLAY :1.
## Connection
VNC receives connections from port 5900 + Display.
Given that DISPLAY is :1 the port will be 5901.

# Running HW accelerated content via VirtualGL
VirtualGL provides a 'vglrun' executable which enables (m)any GUI application to access the GPU when needed.
The command below will run glxgears with hardware acceleration
```bash
vglrun glxgears
```
