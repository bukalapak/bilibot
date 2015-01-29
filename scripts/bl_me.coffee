module.exports = (robot) ->
  robot.respond /(bukalapak|bl)( me)? (.*)/i, (msg) ->
    query = msg.match[3]
    blMe msg, query

blMe = (msg, query) ->
  msg.http("https://api.bukalapak.com/v2/products.json")
    .query({keywords: query})
    .get() (err, res, body) ->
      json = JSON.parse(body)
      if json.status == "OK"
        if json.products.length > 1
          product = msg.random json.products
          msg.send product.url
        else
          msg.send("Maaf, BL kurang lengkap :sob:")
      else
        msg.send("Maaf, BL lagi sakit")
