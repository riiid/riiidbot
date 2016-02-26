# Description:
#   Debug info listener for sledge (https://github.com/riiid/sledge).
#   Post to '/hubot/sledge/:room' will send message to 'room'.
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
    content = JSON.stringify data.content, null, 2
    content = if content is '""'  then '' else "\n```#{content}```"
    robot.messageRoom "#{room}", "#{msg} #{content}"
    res.send 'OK'
