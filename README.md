# riiidbot

Hubot for `riiid`.

## Build docker image

Install [docker](https://docs.docker.com/installation/).

    $ git clone riiid/riiidbot
    $ cd riiidbot
    $ docker build -t riiidbot .

## Run with docker

    $ docker run -it riiidbot

Overrid `entrypoint` to test it locally.

    $ docker run -it --entrypoint=/src/hubot/bin/hubot riiidbot

> passing `--rm` will always give you fresh container. see `$ docker run --help`.

## Running Locally

If you don't like `docker` (:feelsgood:),

    $ git clone riiid/riiidbot
    $ cd riiidbot
    $ bin/hubot

    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading adapter shell
    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading scripts from /home/tomb/Development/hubot/scripts
    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading scripts from /home/tomb/Development/hubot/src/scripts
    Hubot> hubot help

## Scripting

See `scripts/example.coffee`, or visit [Scripting Guide](https://github.com/github/hubot/blob/master/docs/scripting.md).
