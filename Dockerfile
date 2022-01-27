FROM node:15.14.0-buster

ARG URL=https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_96.0.4664.110-1_amd64.deb

RUN  apt-get update && apt-get upgrade -y && apt-get install -y ffmpeg openjdk-11-jdk git gnupg2 wget  

RUN wget -q -O /tmp/google-chrome-stable.deb ${URL} &&\
    apt-get install -y /tmp/google-chrome-stable.deb

RUN useradd -m -U -s /bin/bash user && mkdir /e2e && chown user /e2e
USER user
WORKDIR /e2e
