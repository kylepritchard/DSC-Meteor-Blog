# Global function
insertSuccess = ->
  path = Session.get 'path'
  addText = Session.get 'addText'
  Router.go '/admin/' + path
  toastr.success(addText + ' sucessfully added', 'Success!', {
    "positionClass": "toast-bottom-right"
    "timeOut": "4000"
  } )

updateSuccess = ->
  path = Session.get 'path'
  addText = Session.get 'addText'
  Router.go '/admin/' + path
  toastr.success(addText + ' sucessfully updated', 'Success!', {
    "positionClass": "toast-bottom-right"
    "timeOut": "4000"
  } )

validationFailure = ->
  toastr.error('Please check all the fields for errors', 'Doh!!', {
    "positionClass": "toast-top-center"
    "timeOut": "4000"
  } )

#Forms
@AutoForm.hooks

  # Posts

  # Insert Posts
  'insertPost':
    before:
      insert: (doc) ->
        date = new Date
        username = Meteor.user().profile.username
        author = Meteor.user().profile.realname
        #update the post
        doc.postdate = date
        doc.username = username
        doc.author = author
        doc

      onSuccess: ->
        insertSuccess()

      onError: ->
        validationFailure()

  # Update Posts
  'updatePost':
    before:
      update: (doc) ->
        #Function goes below
        date = new Date
        # update the post
        doc.$set.postdate = date
        doc

    onSuccess: ->
      updateSuccess()

    onError: ->
      validationFailure()

  # Course Types
  ###########################

  # Insert Course Type

  'insertCourseType':
    before:
      insert: (doc) ->
        #Function goes below
        date = new Date
        doc.postdate = date
        username = Meteor.user().profile.username
        author = Meteor.user().profile.realname
        #update the post
        doc.postdate = date
        doc.username = username
        doc.author = author
        doc

    onSuccess: ->
      insertSuccess()

    onError: ->
      validationFailure()

  'updateCourseType':
    before:
      update: (doc) ->
        #Function goes below
        date = new Date
        username = Meteor.user().profile.username
        author = Meteor.user().profile.realname
        #update the post
        doc.$set.postdate = date
        doc.$set.username = username
        doc.$set.author = author
        doc

    onSuccess: ->
      updateSuccess()

    onError: ->
      validationFailure()

  # Insert Course

  'insertCourse':
    before:
      insert: (doc) ->
        #Function goes below
        date = new Date
        doc.postdate = date
        course = CourseTypes.findOne { _id: doc.coursetype }
        doc.title = course.title
        doc.coursetitle = course._id
        doc.coursetype = course.coursetype
        doc.coursedescription = course.coursedescription
        doc.courserequirements = course.courserequirements
        doc.courseduration = course.courseduration
        doc.courseminduration = course.courseminduration
        doc.courseassumedknowledge = course.courseassumedknowledge
        doc.coursedifficulty = course.coursedifficulty
        doc

    onSuccess: ->
      insertSuccess()

    onError: ->
      validationFailure()

  'updateCourse':
    before:
      update: (doc) ->
        date = new Date
        doc.$set.postdate = date
        coursetype = doc.$set.coursetype
        course = CourseTypes.findOne { _id: coursetype }
        doc.$set.title = course.title
        doc.$set.coursetitle = course._id
        doc.$set.coursetype = course.coursetype
        doc.$set.coursedescription = course.coursedescription
        doc.$set.courserequirements = course.courserequirements
        doc.$set.courseduration = course.courseduration
        doc.$set.courseminduration = course.courseminduration
        doc.$set.courseassumedknowledge = course.courseassumedknowledge
        doc.$set.coursedifficulty = course.coursedifficulty
        doc

    onSuccess: ->
      updateSuccess()

    onError: ->
      validationFailure()


  # Insert Events

  'insertEvent':
    before:
      insert: (doc) ->
        #Function goes below
        date = new Date
        doc.postdate = date
        if doc.recurSelect == true
          parentId = Math.floor((Math.random() * 10000) + 1)
          doc.parentId = parentId
          doc.parent = true
          recur = doc.recurString
          dates = RRule.fromString(recur)
          dates = dates.all()
          dates = _.rest(dates)
          _.each dates, (date) ->
            Events.insert
              recurSelect: true
              parentId: parentId
              parent: false
              postdate: date
              title: doc.title
              startDate: date
        doc

    onSuccess: ->
      insertSuccess()

    onError: ->
      validationFailure()

  'updateEvent':
    before:

      update: (doc) ->
        date = new Date
        doc.$set.postdate = date
        doc

    onSuccess: ->
      updateSuccess()

    onError: ->
      validationFailure()
