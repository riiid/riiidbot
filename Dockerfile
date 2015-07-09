FROM node:0.12.6-slim
MAINTAINER kyung yeol kim <kykim@riiid.co>

ADD . /src/hubot/
WORKDIR /src/hubot/

ENTRYPOINT ["/bin/sh","/src/hubot/run"]
