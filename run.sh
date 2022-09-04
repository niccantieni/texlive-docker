#!/bin/zsh

docker stop project-docker; docker rm project-docker; sudo docker run -it --name project-docker --volume $(PWD):/latex --workdir /latex --entrypoint bash texlive-docker:latest