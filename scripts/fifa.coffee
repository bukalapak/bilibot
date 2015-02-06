parse = require('csv-parse')

doubleDigit = (x) ->
  if x > 9
    x + ''
  else
    '0' + x

module.exports = (robot) ->
  robot.respond /show me bl league table/i, (msg) ->
    msg.http("https://docs.google.com/a/bukalapak.com/spreadsheets/d/1GmyU4XTkaJEB4Dk4QHcW3dMKdMFtMPpngC8RNVNQvGk/export")
      .query({format: 'csv', id: '1GmyU4XTkaJEB4Dk4QHcW3dMKdMFtMPpngC8RNVNQvGk', gid: 0})
      .get() (err, res, body) ->
        parse body, {}, (err, arr) ->
          table = "\n"
          lines = arr.slice(0, 15)
          for line in lines
            do (line) ->
              str = line.slice(0, 11).join("\t").concat("\n")
              table = table.concat str
          msg.send table

  robot.respond /show me bl league today match/i, (msg) ->
    msg.http("https://docs.google.com/a/bukalapak.com/spreadsheets/d/1GmyU4XTkaJEB4Dk4QHcW3dMKdMFtMPpngC8RNVNQvGk/export")
      .query({format: 'csv', id: '1GmyU4XTkaJEB4Dk4QHcW3dMKdMFtMPpngC8RNVNQvGk', gid: 953118437})
      .get() (err, res, body) ->
        parse body, {}, (err, arr) ->
          today = new Date()
          todayStr = doubleDigit(today.getDate()) + '/' + doubleDigit(today.getMonth() + 1) + '/' + today.getFullYear()
          console.log todayStr
          schedules = []
          for line in arr
            do (line) ->
              if line[0] == todayStr
                schedule = line.join("\t").concat("\n")
                schedules.push(schedule)
          if schedules.length
            msg.send schedules.join("\n")
          else
            msg.send "Ga ada pertandingan hari ini :sob:"
