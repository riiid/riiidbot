# Description:
#   Debug info listener for sledge (https://github.com/riiid/sledge).
#
# Dependencies:
#   None
#
# Configuration:
#  EXPRESS_PORT
#
# Commands:
#   None
#
# Author:
#   chitacan

module.exports = (robot) ->

  # enable CORS to EVERY ORIGIN
  robot.router.all '*', (req, res, next) ->
    res.header 'Access-Control-Allow-Origin', '*'
    res.header 'Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept'
    next()

  robot.router.post '/hubot/sledge/:room', (req, res) ->
    room = req.params.room
    data = if req.body.payload?
      JSON.parse req.body.payload
    else
      req.body

    msg     = data.message
    content = data.content
    robot.messageRoom "#{room}", "#{msg}\n```#{content}```"
    res.send 'OK'
