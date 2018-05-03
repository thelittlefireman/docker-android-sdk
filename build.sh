#!/bin/bash
declare -a android_version=("25" "26" "27")
declare -a android_build_tool_version=("25.0.3" "26.0.3" "27.0.3")

docker login --username=$1 --password=$2
## now loop through the above array
index=0
for i in "${android_version[@]}"
do
   echo "$i"
   docker build -t "thelittlefireman/docker-android-sdk:$i" --build-arg ANDROID_VERSION=$i --build-arg ANDROID_BUILD_TOOLS_VERSION=${android_build_tool_version[i]} .
   docker push "thelittlefireman/docker-android-sdk:$i"
   index=$((index + 1))
done