#!/bin/zsh

docker exec beamer1-docker pdflatex beamer1.tex

# other option:
# docker exec beamer1-docker bash -l -c 'pdflatex beamer1.tex'