FROM debian:bullseye

RUN apt update -y
RUN apt install --no-install-recommends -y \
    wget=1.21-1+deb11u1 ca-certificates=20210119 perl-doc=5.32.1-4+deb11u2 man-db=2.9.4-2 less=551-2

WORKDIR /root/temp

RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN mkdir install-today
# this extracts the tar and puts it into install-today (since the tar contains a directory name with today's date in it, it would be difficult to cd into it otherwise)
RUN zcat install-tl-unx.tar.gz | tar xf - -C /root/temp/install-today --strip-components=1
WORKDIR /root/temp/install-today

RUN perl ./install-tl --no-interaction --scheme=small

ENV PATH "/usr/local/texlive/2022/bin/aarch64-linux:$PATH"

RUN tlmgr install latexmk
RUN tlmgr install biber
RUN tlmgr install texcount
RUN tlmgr install latexindent
