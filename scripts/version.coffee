# Description:
#   Print version
#
# Commands:
#   hubot version
#   hubot 버전
#
# Author:
#   chitacan

module.exports = (robot) ->

  robot.respond /(version|버전)/i, (msg) ->
    pkg = require '../package.json'
    msg.send ":hubot: v#{pkg.version}"
