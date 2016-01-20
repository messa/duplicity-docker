FROM debian:jessie

MAINTAINER Petr Messner, petr.messner@gmail.com

# prevent apt warnings about unusable dialog frontend
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apt-utils \
        ca-certificates \
        wget && \
    apt-get clean

RUN wget https://code.launchpad.net/duplicity/0.7-series/0.7.06/+download/duplicity-0.7.06.tar.gz

RUN echo 08b7ee08e52205b73541829f83485b79f360ba2c duplicity-0.7.06.tar.gz | sha1sum --check -

RUN tar xf duplicity-*.tar.gz

RUN apt-get install -y --no-install-recommends \
        gcc \
        gnupg \
        librsync-dev \
        python2.7 \
        python-dev \
        python-lockfile \
        python-setuptools && \
    apt-get clean

RUN cd duplicity-*/ && python2.7 setup.py install

