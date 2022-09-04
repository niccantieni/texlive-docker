FROM debian:bullseye

RUN apt update -y
RUN apt install --no-install-recommends -y \
    wget ca-certificates perl-doc

WORKDIR /root/temp

RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN mkdir install-today
# this extracts the tar and puts it into install-today (since the tar contains a directory name with today's date in it, it would be difficult to cd into it otherwise)
RUN zcat install-tl-unx.tar.gz | tar xf - -C /root/temp/install-today --strip-components=1
WORKDIR /root/temp/install-today

RUN perl ./install-tl --no-interaction --scheme=small

ENV PATH "/usr/local/texlive/2022/bin/aarch64-linux:$PATH"