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

  robot.router.post '/hubot/sledge/:room', (req, res) ->
    room = req.params.room
    data = if req.body.payload?
      JSON.parse req.body.payload
    else
      req.body

    console.log data

    msg     = data.message
    content = data.content
    robot.messageRoom "#sledge_debug", "#{msg}\n#{content}"
    res.send 'OK'
