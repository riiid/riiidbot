FROM node:5-slim
MAINTAINER kyung yeol kim <kykim@riiid.co>

WORKDIR /src/riiidbot/
ADD . /src/riiidbot/
RUN npm install

ENTRYPOINT ["npm"]
CMD ["start"]
