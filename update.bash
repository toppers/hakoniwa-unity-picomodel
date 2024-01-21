#!/bin/bash

# FROM: plugin/plugin-srcs/Assets/
# TO: pico/Assets

FROM_DIR=plugin/plugin-srcs/Assets/
TO_DIR=pico/Assets

do_copy()
{
    local from=${1}
    local to=${2}
    #echo "FROM: $from"
    #ls $from
    #echo "TO  : $to"
    #ls $to
    diff -r $from $to > /dev/null
    if [ $? -ne 0 ]
    then
        echo "INFO: FOUND DIFF on ${from} and ${to}"
        echo "INFO: updating.."
        cp $from/* $to/
    fi
}

# pico/Assets/Plugin/src/Unity/AR/Assets
FROM_SRC_DIR=${FROM_DIR}/Plugin/src/Unity/AR/Assets
TO_SRC_DIR=${TO_DIR}/Plugin/src/Unity/AR/Assets
do_copy ${FROM_SRC_DIR} ${TO_SRC_DIR}

# pico/Assets/Plugin/src/Unity/AR/Core
FROM_SRC_DIR=${FROM_DIR}/Plugin/src/Unity/AR/Core
TO_SRC_DIR=${TO_DIR}/Plugin/src/Unity/AR/Core
do_copy ${FROM_SRC_DIR} ${TO_SRC_DIR}

# pico/Assets/Prefab/Robots
FROM_SRC_DIR=${FROM_DIR}/Prefab/Robots
TO_SRC_DIR=${TO_DIR}/Prefab/Robots
do_copy ${FROM_SRC_DIR} ${TO_SRC_DIR}
rm -f pico/Assets/Prefab/Robots/SampleRobot.prefab* pico/Assets/Prefab/Robots/SampleRobotTestDriver.prefab*

# pico/Assets/Scenes/Pico
FROM_SRC_DIR=${FROM_DIR}/Scenes/Pico
TO_SRC_DIR=${TO_DIR}/Scenes/Pico
do_copy ${FROM_SRC_DIR} ${TO_SRC_DIR}

# pico/Assets/Scripts/HakoAssets/PluggableAsset/Assets/Robot/Pico
FROM_SRC_DIR=${FROM_DIR}/Scripts/HakoAssets/PluggableAsset/Assets/Robot/Pico
TO_SRC_DIR=${TO_DIR}/Scripts/HakoAssets/PluggableAsset/Assets/Robot/Pico
do_copy ${FROM_SRC_DIR} ${TO_SRC_DIR}
