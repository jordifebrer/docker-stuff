#!/usr/bin/env bash
# dockerfind.sh -- retrieves information about docker running containers based on the docker ps command
#
# command: 
#   ./dockerfind.sh query  returning_values
# returns a specific field (second parameter) of the container when it fits the criteria (first parameter)
# 
# example 1: How to get the container name running on port 8080 ? 
#   ./dockerfind.sh "8080" "NAMES"
#
# example 2: How to get the container ids running a centos base image ? 
#   ./dockerfind.sh "centos" "CONTAINER ID"
header=$(docker ps | head -1 | sed -E "s/ {2,}/$(printf '\t')/g")
IFS=$'\t' read -a array <<< "$header"
for index in "${!array[@]}"
do
    if [ "$2" = "${array[index]}" ];
    then
        docker ps | grep "$1" | sed -E "s/ {2,}/$(printf '\t')/g" | cut -d$'\t' -f$(($index+1))
        break
    fi
done

