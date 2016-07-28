#!/bin/bash

cyan=$'\e[1;36m'
normal=$(tput sgr0)

#if [[ -z ${1} ]]; then
if [[ -n ${file} ]]; then
  printf "\nDownloading file ${cyan}${file}${normal}\n\n"
  wget $file -O test.json
else
  printf "\nLoaded test file. To load a local file you can run the following command in another terminal:\n\n"
  printf "${cyan}docker cp YOUR_FILE.json jsonserver-container:/tmp/test.json${normal}\n\n"
fi

json-server --port 8080 --watch test.json
