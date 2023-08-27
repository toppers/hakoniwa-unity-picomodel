#!/bin/bash

if [ -d plugin/plugin-srcs ]
then
    :
else
    echo "ERROR: can not find submodule plugin"
    echo "git pull"
    echo "git submodule update --init --recursive"
    exit 1
fi

cd plugin

bash install.bash
cd ..

cp -rp pico/Assets/* plugin/plugin-srcs/Assets/
cp -rp pico/ros_types/* plugin/plugin-srcs/ros_types/
cp pico/hakoniwa_path.json plugin/plugin-srcs/
