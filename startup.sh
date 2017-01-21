#!/bin/bash
# this script is supposed to be executed as user source startup.sh
(cd $(dirname "${BASH_SOURCE}");
vncserver -kill $DISPLAY # kill any existing vnc server on given display
vncserver $DISPLAY # start vnc display :1
)
