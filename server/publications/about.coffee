Meteor.publish 'about', ->
    About.find()

Meteor.publish 'single-about', (id) ->
    About.find {_id: id}
