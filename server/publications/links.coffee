Meteor.publish 'sailing-links', ->
    Sailing.find {},
        fields:
            'title': 1

Meteor.publish 'training-links', ->
    Training.find {},
        fields:
            'title': 1

Meteor.publish 'about-links', ->
    About.find {},
        fields:
            'title': 1

Meteor.publish 'social-links', ->
    Social.find {},
        fields:
            'title': 1
