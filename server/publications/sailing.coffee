Meteor.publish 'sailingpages', ->
    Sailing.find()

Meteor.publish 'single-sailingpage', (id) ->
    Sailing.find {_id: id}

Meteor.publish 'batteryrota', ->
    today = new Date
    BatteryRota.find {date: {$gt: today}}
