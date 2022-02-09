FROM node:15.14.0-buster

ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'APT::Install-Suggests "false";\n'\
         'APT::Install-Recommends "false";\n' > /etc/apt/apt.conf.d/02-no-recommends
RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get install -y default-jre &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

RUN mkdir /e2e /cache && chown node:node /e2e /cache

COPY yarn.sh entrypoint.sh /usr/local/bin/
RUN cd /usr/local/bin &&\
    mv yarn yarn.wrp &&\
    mv yarn.sh yarn &&\
    chmod +x yarn entrypoint.sh

USER node
WORKDIR /e2e
VOLUME [ "/e2e" ]

COPY --chown=node package.json yarn.lock /cache/
COPY --chown=node patches /cache/patches

RUN cd /cache &&\
    yarn.wrp install --frozen-lockfile &&\
    rm -rf /home/node/.cache /tmp/* 2>/dev/null ||:

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh"]
