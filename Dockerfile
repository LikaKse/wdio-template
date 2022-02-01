FROM node:15.14.0-buster

ARG VERSION=96.0.4664.110-1
ENV URL=https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${VERSION}_amd64.deb

RUN  apt-get update && apt-get upgrade -y && apt-get install -y openjdk-11-jdk git gnupg2 wget  

RUN wget -q -O /tmp/google-chrome-stable.deb ${URL} &&\
    apt-get install -y /tmp/google-chrome-stable.deb

RUN mkdir /e2e && chown node /e2e
USER node
WORKDIR /e2e
