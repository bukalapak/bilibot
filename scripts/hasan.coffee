module.exports = (robot) ->
    robot.respond /hasan jelek?/i, (msg) ->
        msg.send "emang..."
    robot.respond /hasan ganteng?/i, (msg) ->
        msg.send "jangan berkhayal ah..."
