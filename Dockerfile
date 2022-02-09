FROM node:15.14.0-buster

RUN  apt-get update && apt-get upgrade -y && apt-get install -y default-jre

RUN mkdir /e2e /cache && chown node:node /e2e /cache

COPY yarn.sh /usr/local/bin/
RUN cd /usr/local/bin &&\
    mv yarn yarn.wrp &&\
    mv yarn.sh yarn &&\
    chmod +x yarn

USER node
WORKDIR /e2e
VOLUME [ "/e2e" ]

COPY --chown=node package.json yarn.lock /cache/
COPY --chown=node patches /cache/patches

RUN cd /cache &&\
    yarn.wrp install --frozen-lockfile

ENTRYPOINT [ "/usr/local/bin/yarn", "test"]
