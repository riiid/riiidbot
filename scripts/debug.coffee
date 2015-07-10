# Description:
#   Print useful debug information about redribbot
#
# Commands:
#   hubot debug listener - print redribbot's regex listners.
#
# Author:
#   chitacan

_     = require 'underscore'
fs    = require 'fs'
path  = require 'path'
https = require 'https'
url   = require 'url'

module.exports = (robot) ->
  prettify = (msg) -> "```#{msg}```"

  robot.respond /debug listener$/i, (msg) ->
    lstnr = _.pluck(robot.listeners, 'regex').join '\n'
    msg.send prettify lstnr
