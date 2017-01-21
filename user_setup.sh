#!/bin/bash
echo 'export PATH=/opt/TurboVNC/bin/:$PATH' >> ~/.bashrc
export PATH=/opt/TurboVNC/bin/:$PATH
echo 'export DISPLAY=:1' >> ~/.bashrc
export DISPLAY=:1
mkdir -p ~/.vnc
rm -f ~/.vnc/passwd
# vnc password is the first 8 charaters of the instance name
wget -q -O - http://169.254.169.254/latest/meta-data/instance-id | cut -c1-8 | xargs echo | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd
touch ~/.Xauthority
