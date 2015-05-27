Meteor.publish 'trainingpages', ->
    Training.find()

Meteor.publish 'single-trainingpage', (id) ->
    Training.find {_id: id}

Meteor.publish 'coursetypes', ->
    CourseTypes.find()

Meteor.publish 'single-coursetype', (id) ->
    CourseTypes.find {_id: id}

Meteor.publish 'courses', ->
    Courses.find()

Meteor.publish 'single-course', (id) ->
    Courses.find {_id: id}
