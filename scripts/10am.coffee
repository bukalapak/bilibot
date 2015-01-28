
module.exports = (robot) ->
    assignments = 
        mon: ["zakkafauzan", "rennywijayanti", "kautzar", "ragapinilih"]
        tue: ["andika", "hasanizer", "ardfard", "krisnadibyo93"]
        wed: ["swaas", "sdsdkkk", "devita", "araishikeiwai"]
        thu: ["yuri", "hadisaloko", "widatama"]
        fri: ["rizal", "pras", "dani"]

    days = ["sun", "mon", "tue", "wed", "thu", "fri"]

    robot.respond /siapa yang bawa snack hari ini/i, (msg) ->
        today = new Date()
        peoples = assignments[days[today.getDay()]].join(", ")
        msg.send (peoples + " hari ini bawa snack ya :wink:")