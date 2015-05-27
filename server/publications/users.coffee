Meteor.publish 'users', ->
    Meteor.users.find({} , {fields: {profile: 1} } )
