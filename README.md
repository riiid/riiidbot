# riiidbot

Hubot for `riiid`.

## Run

    $ docker run -it \
      -e HUBOT_SLACK_TOKEN=<YOUR_SLACK_TOKEN> \
      -e FIREBASE_URL=<FIREBASE_URL> \
      -e FIREBASE_SECRET=<FIREBASE_SECRET> \
      riiid/riiidbot

Override `entrypoint` to test it locally.

    $ docker run -it --entrypoint=/src/hubot/bin/hubot riiid/riiidbot

> passing `--rm` will always give you fresh container. see `$ docker run --help`.

## Running Locally

If you don't like `docker` (:feelsgood:),

    $ git clone riiid/riiidbot
    $ cd riiidbot
    $ bin/hubot
    Hubot> hubot help

## Scripting

See `scripts/example.coffee`, or visit [Scripting Guide](https://github.com/github/hubot/blob/master/docs/scripting.md).
