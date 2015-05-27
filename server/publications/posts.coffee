Meteor.publish 'posts', ->
    Posts.find()

Meteor.publish 'single-post', (id) ->
    Posts.find {_id: id}
