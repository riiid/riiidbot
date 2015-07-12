# Description:
#   Print useful debug information about redribbot
#
# Commands:
#   hubot debug listener - print redribbot's regex listners.
#   hubot debug fb <path> - print firebase data.
#
# Author:
#   chitacan

_     = require 'underscore'
fs    = require 'fs'
path  = require 'path'
https = require 'https'
url   = require 'url'
B     = require 'riiidbot-brain'

module.exports = (robot) ->
  prettify = (msg) -> "```#{msg}```"

  robot.respond /debug listener$/i, (msg) ->
    lstnr = _.pluck(robot.listeners, 'regex').join '\n'
    msg.send prettify lstnr

  robot.respond /debug fb\s?(.*)?/i, (msg) ->
    auth = B.root?.getAuth()
    unless auth
      msg.send ":interrobang: :hubot: is not authorized to do this."
    pathParam = msg.match[1] ? 'scripts'
    endPoint  = "#{url.resolve 'https://riiidbot.firebaseio.com', pathParam}.json?auth=#{auth.token}"
    https.get endPoint, (res) ->
      result = ''
      res.setEncoding('utf8')
      res.on 'data', (c) -> result += c.toString()
      res.on 'end' , ( ) ->
        if result? and result isnt 'null'
          p = JSON.parse result
          msg.send prettify JSON.stringify p, null, 4
        else
          msg.send ":interrobang: R U sure ??"
