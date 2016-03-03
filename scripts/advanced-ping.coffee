# Description:
#   Ping, emojified.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   chitacan

EMOJIS = [
  'ok'
  'ear'
  'gun'
  'hubot'
  'metal'
  'question'
  'hand'
  'raising_hand'
  'ok_hand'
  'shipit'
]
TOKEN = process.env.HUBOT_SLACK_TOKEN

module.exports = (robot) ->
  name_regex = new RegExp("#{robot.name}:?\\s?\\?$", "i")

  robot.hear name_regex, (msg) ->
    unless TOKEN
      msg.reply msg.random EMOJIS
    else
      emoji = msg.random EMOJIS
      {message: {rawMessage: {channel, ts}}} = msg
      msg.http 'https://slack.com/api/reactions.add'
        .query token: TOKEN, name: emoji, channel: channel, timestamp: ts
        .get() (err, res, body) ->
          if err
            robot.logger.error err.message
          else
            robot.logger.info body
