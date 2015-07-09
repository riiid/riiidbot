FROM node:0.12.6-slim
MAINTAINER kyung yeol kim <kykim@riiid.co>

WORKDIR /src/hubot/
ADD . /src/hubot/
RUN npm install

ENTRYPOINT ["/bin/sh","/src/hubot/run"]
