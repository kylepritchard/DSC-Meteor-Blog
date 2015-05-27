Meteor.publish 'social', ->
    Social.find()

Meteor.publish 'single-social', (id) ->
    Social.find {_id: id}
