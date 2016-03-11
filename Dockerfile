FROM node:5-slim
MAINTAINER kyung yeol kim <kykim@riiid.co>

WORKDIR /src/riiidbot/
ADD ./package.json /src/riiidbot/package.json
RUN npm install
ADD . /src/riiidbot/

EXPOSE 9598

ENTRYPOINT ["npm"]
CMD ["start"]
