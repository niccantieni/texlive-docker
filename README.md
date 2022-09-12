# `texlive-docker` a simple docker-container with texlive installed

## Versioning
The container ist tagged as follows: `v[major-version].[minor-version].[dependencies]`. The last numer is changed if the only changes were bumped versions of dependencies without (many?) breaking changes.

## Usage

```bash
# build the image
make

# then, change to your latex-directory
cp *.sh /path/to/latex/files
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