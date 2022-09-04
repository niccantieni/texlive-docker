# `texlive-docker` a simple docker-container with texlive installed

## usage

```bash
# build the image
make

# then, change to your latex-directory
cd /path/to/latex/files

# only first time: create container
./run.sh

# each time when starting compilation
./start.sh

# compile
./compile.sh

# stopping
./stop.sh

# install a package
docker exec -it project-docker bash
tlmgr install PACKAGE
```