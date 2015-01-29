
module.exports = (robot) ->
    assignments = 
        mon: ["zakkafauzan", "rennywijayanti", "kautzar", "ragapinilih"]
        tue: ["andika", "hasanizer", "ardfard", "krisnadibyo93"]
        wed: ["swaas", "sdsdkkk", "devita", "araishikeiwai"]
        thu: ["yuri", "hadisaloko", "widatama"]
        fri: ["rizal", "pras", "dani"]

    days = ["sun", "mon", "tue", "wed", "thu", "fri"]
    bhs_to_eng =
        senin: "mon"
        selasa: "tue"
        rabu: "wed"
        kamis: "thu"
        jumat: "fri"

    robot.respond /siapa yang bawa snack hari (\w+)/i, (msg) ->
        day = msg.match[1]
        pesan = " hari #{day} bawa snack ya :wink:"
        if day is "ini"
            today = new Date()
            peoples = assignments[days[today.getDay()]].join(", ")
            msg.send (peoples + pesan)
        else 
            peoples = assignments[bhs_to_eng[day]]
            if peoples is undefined
                msg.send "ga ada yang bawa snack hari itu"
            else
                msg.send peoples.join(", ") + pesan
