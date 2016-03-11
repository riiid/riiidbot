# riiidbot

Hubot for `riiid`.

## Run

Build docker image for `riiidbot`,

    $ docker build -t riiid/riiidbot .

And run,

    $ docker run -it --rm riiid/riiidbot run start-dev

Or with full env variables,

    $ docker run -it --rm \
      -e HUBOT_SLACK_TOKEN=<YOUR_SLACK_TOKEN> \
      -e FIREBASE_URL=<FIREBASE_URL> \
      -e FIREBASE_SECRET=<FIREBASE_SECRET> \
      -e EXPRESS_PORT=<PORT_FOR_HUBOT> \
      riiid/riiidbot

> passing `--rm` will always give you fresh container. see `$ docker run --help`.

## Running Locally

If you don't like `docker` (:feelsgood:),

    $ git clone riiid/riiidbot
    $ cd riiidbot
    $ npm run start-dev
    Hubot> hubot help

## Scripting

See `scripts/example.coffee`, or visit [Scripting Guide](https://github.com/github/hubot/blob/master/docs/scripting.md).

## Deploy

### elastic beanstalk

    $ eb init
    $ eb create
    $ eb setenv HUBOT_SLACK_TOKEN=<YOUR_SLACK_TOKEN> \
      FIREBASE_URL=<FIREBASE_URL> \
      FIREBASE_SECRET=<FIREBASE_SECRET> \
      EXPRESS_PORT=<PORT_FOR_HUBOT>
    $ eb deploy

### docker images

You can pull latest docker image for `riiidbot` via [Docker Hub](https://hub.docker.com/r/riiid/riiidbot/)

    $ docker pull riiid/riiidbot
    $ docker run -it --rm riiid/riiidbot run start-dev
